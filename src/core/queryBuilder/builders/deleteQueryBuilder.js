import { QueryBaseBuilder } from "../base/QueryBaseBuilder";
import { WhereClauseBuilder } from "../clauses/whereClauseBuilder";


export class DeleteQueryBuilder extends QueryBaseBuilder {
    #data

    constructor() {
        this.#data = null
        this.whereClause = new WhereClauseBuilder();
    }
    
    from(tableName) {
        return this._setTable(tableName);
    }

}