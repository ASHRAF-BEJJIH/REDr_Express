import { QueryBaseBuilder } from "../base/QueryBaseBuilder";
import { WhereClauseBuilder } from "../clauses/whereClauseBuilder"
import { validateSelect, validateTable } from "../validators/queryBuilderValidator";


export class SelectQueryBuilder extends QueryBaseBuilder {
    constructor() {
        this.columns = ["*"];

        this.whereClause = new WhereClauseBuilder();
        this.orders = [];

        this.limit = null;
        this.offset = null;

    }

    select(columns) {
        validateSelect(columns)

        this.columns = columns;
        return this
    }

    from(table) {
        return this._setTable(table)
    }

    where(conditions) {
        this.whereClause.where(conditions)
        return this
    }

    andWhere(conditions) {
        this.whereClause.andWhere(conditions)
        return this
    }

    orWhere(conditions) {
        this.whereClause.orWhere(conditions)
        return this
    }

    andWhereGroup(conditions) {
        this.whereClause.andWhereGroup(conditions)
        return this
    }

    orWhereGroup(conditions) {
        this.whereClause.orWhereGroup(conditions)
        return this
    }

    build() {

    }



}