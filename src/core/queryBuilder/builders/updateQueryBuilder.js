import { QueryBaseBuilder } from "../base/QueryBaseBuilder";
import { WhereClauseBuilder } from "../clauses/whereClauseBuilder";


export class UpdateQueryBuilder extends QueryBaseBuilder {
    constructor() {
        this.data = null
        this.whereClause = new WhereClauseBuilder();
    }
    table(tableName) {
        return this._setTable(tableName);
    }

}