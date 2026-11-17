import { QueryBuilder } from "../builders/queryBuilder.js";
import { ComparisonOperator } from "../constants/comparisonOperator.js";
import { LogicalOperator } from "../constants/logicalOperator.js";
import { validateConditions } from "../validators/queryBuilderValidator.js";

const ConditionType = Object.freeze({

    CONDITION: "condition",

    GROUP: "group"

});

export class WhereClauseBuilder {
    constructor() {
        this.indentation = "\n\t"
        this.conditions = [];
    }

    where(conditions) {
        return this.#_addConditions(conditions);
    }

    andWhere(conditions) {
        return this.#_addConditions(conditions, LogicalOperator.AND);
    }

    orWhere(conditions) {
        return this.#_addConditions(conditions, LogicalOperator.OR);
    }

    andWhereGroup(callback) {
        return this.#_addWhereGroup(callback, LogicalOperator.AND)
    }

    orWhereGroup(callback) {
        return this.#_addWhereGroup(callback, LogicalOperator.OR)
    }

    get isEmpty() {
        return this.conditions.length === 0;
    }

    build(params) {
        return this.#_buildConditions(this.conditions, params)
    }

    #_addConditions(conditions, logicalOperator = null) {
        if (typeof conditions === "function") {
            conditions(this)
            return this
            
        }

        if (logicalOperator)
            this.#_ensureWhereExists();

        validateConditions(conditions);
        const normalized = this.#_normalizeConditions(conditions)
        this.conditions.push(...normalized)

        return this
    }

    #_addWhereGroup(callback, logicalOperator) {
        if (!callback || typeof callback === "function")
            throw new Error(`(${logicalOperator}) - WhereGroup expects a callback function.`)

        this.#_ensureWhereExists()

        const group = new WhereClauseBuilder();
        callback(group)
        this.#_ensureGroupNotEmpty(group);

        this.conditions.push({
            type: ConditionType.GROUP,
            logicalOperator,
            conditions: group.conditions
        })

        return this
    }
    #_buildConditions(conditions, params) {
        return conditions.map(condition =>
        (condition.type === ConditionType.GROUP ?
            this.#_buildGroup(condition, params) : this.#_buildCondition(condition, params))).join(' ')
    }
    #_buildGroup(group, params) {
        const { logicalOperator, conditions } = group
        const innerSql = this.#_buildConditions(conditions);
        return `${this.indentation}${logicalOperator} ( ${innerSql} )`
    }
    #_buildCondition(condition, params) {
        const { logicalOperator, operator, column, value } = condition;
        let sql = "";

        if (logicalOperator)
            sql += `${logicalOperator} `

        if (operator === ComparisonOperator.IN) {
            if (!Array.isArray(value) || value.length === 0)
                throw new Error("IN operator expects a non-empty array.")
            const placeholders = value.map(() => '?').join(", ")
            sql += `${column} IN (${placeholders})`
            params.push(...value)
            return sql;
        }

        if (value == null) {
            if (operator === ComparisonOperator.EQ)
                return `${logicalOperator ? `${logicalOperator}` : ""} ${column} IS NULL`
            if (operator === ComparisonOperator.NE)
                return `${logicalOperator ? `${logicalOperator}` : ""} ${column} IS NOT NULL`
            throw new Error(`Operator ${operator} cannot be used with null.`)
        }

        // Objet non supporté

        if (typeof value === "object")
            throw new Error(`Unsupported condition value for column "${column}".`)

        params.push(value)
        sql += `${column} ${operator} ?`
        return sql;
    }
    #_normalizeConditions(conditions, logicalOperator = null) {
        if (!conditions || typeof conditions !== "object") {
            throw new Error("Conditions must be an object.");
        }
        return Object.entries(conditions).map(([column, value], index) => {
            let operator = ComparisonOperator.EQ
            let actualValue = value
            if (typeof value == "object" && value !== null) {
                operator = value.operator ?? ComparisonOperator.EQ
                actualValue = value.value;
            }

            validateOperator(operator);
            const logicalOperatorActual = logicalOperator ?? LogicalOperator.AND;
            // console.log(logicalOperatorActual, logicalOperator === null && index == 0 ? null : logicalOperatorActual)

            return {
                type: ConditionType.CONDITION,
                logicalOperator: logicalOperator === null && index == 0 ? "" : logicalOperatorActual,
                operator,
                column,
                value: actualValue
            }
        });
    }

    #_ensureWhereExists() {

        if (this.query.where.length === 0) {
            throw new Error(
                "The where() method must be called first."
            );
        }
    }

    #_ensureGroupNotEmpty(group) {
        // console.log('Where group cannot be empty.', group)
        if (group.query.where.length === 0) {
            throw new Error(
                "Where group cannot be empty."
            );
        }
    }
}