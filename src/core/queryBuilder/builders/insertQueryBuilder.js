import { QueryBaseBuilder } from "../base/QueryBaseBuilder";
import { validateTable } from "../validators/queryBuilderValidator"

export class InsertQueryBuilder extends QueryBaseBuilder {
    constructor() {
        this.data = null
    }

    into(table) {
        return this._setTable(table)
    }


    build() {

    }


}