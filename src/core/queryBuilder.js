export class QueryBuilder {
    constructor() {
        this.query = {
            select: "*",
            table: null,
            where: [],
            orderBy: null,
            limit: null,
            offset: null

        }
    }
    select(columns) {
        this.query.select = columns 
        return this
    }
    from(table) {
        this.query.table = table;
        return this
    }
    where({column ,operator = "=",value}) {
        this.query.where.push({column,operator ,value})
        return this
    }
    orderBy() {
        return this
    }
    limit() {
        return this
    }
    offset() {
        return this
    }
    build() {
        return this
    }
}