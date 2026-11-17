import { DeleteQueryBuilder } from "./deleteQueryBuilder";
import { InsertQueryBuilder } from "./insertQueryBuilder";
import { SelectQueryBuilder } from "./selectQueryBuilder";
import { UpdateQueryBuilder } from "./updateQueryBuilder";

export class QueryBuilder {
    static select() {
        return new SelectQueryBuilder()
    }

    static insert() {
        return new InsertQueryBuilder()
    }

    static update() {
        return new UpdateQueryBuilder()
    }

    static delete() {
        return new DeleteQueryBuilder()
    }
}
