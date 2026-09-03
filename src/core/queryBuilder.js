import { ComparisonOperator } from "./constants/comparisonOperator.js";
import { LogicalOperator } from "./constants/logicalOperator.js";
import { SortDirection } from "./constants/sortDirection.js";
import { validateConditions, validateLimit, validateOffset, validateOperator, validateOrderBy, validateSelect, validateTable } from "./validators/queryBuilderValidator.js";

const TypeCondition = Object.freeze({
    CONDITION: "condition",
    GROUP: "group"
});

export class QueryBuilder {
    constructor() {
        this.indentation = "\n\t"
        this.query = {
            type: TypeCondition.CONDITION,
            select: ["*"],
            table: null,
            where: [],
            orderBy: [],
            limit: null,
            offset: null
        }

    }
    select(columns) {
        validateSelect(columns)

        this.query.select = columns
        return this
    }
    from(table) {
        validateTable(table)

        this.query.table = table;
        return this
    }
    _normalizeConditions(conditions, logicalOperator = null) {
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
                type: TypeCondition.CONDITION,
                logicalOperator: logicalOperator === null && index == 0 ? "" : logicalOperatorActual,
                operator,
                column,
                value: actualValue
            }
        });
    }
    where(conditions) {
        validateConditions(conditions)
        const normalized = this._normalizeConditions(conditions);
        this.query.where.push(...normalized)
        return this
    }
    andWhere(conditions) {
        validateConditions(conditions)
        this._ensureWhereExists()
        const normalized = this._normalizeConditions(conditions, LogicalOperator.AND);
        this.query.where.push(...normalized)
        return this
    }
    orWhere(conditions) {
        validateConditions(conditions)
        this._ensureWhereExists()

        const normalized = this._normalizeConditions(conditions, LogicalOperator.OR);
        this.query.where.push(...normalized)
        return this
    }

    orderBy(column, direction = SortDirection.ASC) {
        validateOrderBy(column, direction)

        this.query.orderBy = {
            column,
            direction: direction.toUpperCase()
        }
        return this
    }
    orderBy(ordersDirectionObject) {
        const ordersDirection = Object.entries(ordersDirectionObject).map(
            ([column, direction]) => {
                const orderDirection = { column, direction }
                validateOrderBy(orderDirection)
                return orderDirection
            });
        this.query.orderBy.push(...ordersDirection)
        return this
    }
    limit(limit) {
        if (limit !== null) {
            validateLimit(limit)
            this.query.limit = limit
        }
        return this
    }
    offset(offset) {
        if (offset !== null) {
            validateOffset(offset)
            this.query.offset = offset
        }
        return this
    }
    orWhereGroup(callback) {

        if (!callback || typeof callback !== "function")
            throw new Error("orWhereGroup() expects a callback function.")
        console.log("orWhereGroup")
        this._ensureWhereExists();
        const group = new QueryBuilder();
        callback(group)
        console.log(group)
        this._ensureGroupNotEmpty(group);
        this.query.where.push({
            type: TypeCondition.GROUP,
            logicalOperator: LogicalOperator.OR,
            conditions: group.query.where
        });
        return this
    }
    andWhereGroup(callback) {
        if (!callback || typeof callback !== "function")
            throw new Error("andWhereGroup() expects a callback function.")

        this._ensureWhereExists();
        const group = new QueryBuilder();
        callback(group)
        console.log(group)

        this._ensureGroupNotEmpty(group);
        console.log("test")
        this.query.where.push({
            type: TypeCondition.GROUP,
            logicalOperator: LogicalOperator.AND,
            conditions: group.query.where
        });
        return this
    }
    _buildConditions(conditions, params) {
        return conditions.map(condition => {

            if (condition.type === TypeCondition.GROUP)
                return this._buildGroup(condition, params);

            return this._buildCondition(condition, params)
        }).join(' ');
    }
    _buildGroup(group, params) {
        console.log("build group :: ", group)
        console.log("not test")
        const { logicalOperator, conditions } = group
        const innerSql = this._buildConditions(conditions, params)
        return `${this.indentation}${logicalOperator} ( ${innerSql} )`
    }
    _buildCondition(condition, params) {
        const { logicalOperator, operator, column, value } = condition
        let sql = "";
        console.log("build condition : ", condition)
        if (logicalOperator)
            sql += `${logicalOperator} `

        if (operator === ComparisonOperator.IN) {
            if (!Array.isArray(value) || value.length === 0)
                throw new Error("IN operator expects a non-empty array.")
            const placeholders = value.map(() => '?').join(", ");
            params.push(...value)
            sql += ` ${column} IN (${placeholders})`
            return sql
        }

        if (value == null) {
            if (operator === ComparisonOperator.EQ)
                return `${logicalOperator ? logicalOperator + "" : ""} IS NULL`
            if (operator === ComparisonOperator.NE)
                return `${logicalOperator ? logicalOperator + "" : ""} IS NOT NULL`
            throw new Error(
                `Operator ${operator} cannot be used with null.`
            );
        }
        params.push(value)
        sql += `${column} ${operator} ?`
        return sql;
    }
    build() {
        if (!this.query.table)
            throw new Error("FROM table is required.")

        let sql = `SELECT ${this.query.select} FROM ${this.query.table} `;
        const params = [];

        // console.log(this.)
        if (this.query.where.length > 0) {
            const conditions = this._buildConditions(this.query.where, params);

            sql += (conditions.length ? `${this.indentation}WHERE ${conditions}` : "")
        }
        // ORDER BY
        if (this.query.orderBy.length) {
            console.log(this.query.orderBy.length)
            console.log(this.query.orderBy)
            const orderBy = this.query.orderBy.map(({ column, direction }) => `${column} ${direction}`).join(", ");
            sql += ` ${this.indentation}ORDER BY ${orderBy}`
        }

        // LIMIT
        if (this.query.limit !== null) {
            sql += ` ${this.indentation}LIMIT ?`
            params.push(this.query.limit);
        }
        // OFFSET
        if (this.query.offset !== null) {
            sql += ` ${this.indentation}OFFSET ?`
            params.push(this.query.limit);
        }
        // console.log(params)

        return {
            sql,
            params
        }
    }
    _ensureWhereExists() {

        if (this.query.where.length === 0) {
            throw new Error(
                "The where() method must be called first."
            );
        }
    }
    _ensureGroupNotEmpty(group) {
        console.log('Where group cannot be empty.', group)
        if (group.query.where.length === 0) {
            throw new Error(
                "Where group cannot be empty."
            );
        }
    }
}