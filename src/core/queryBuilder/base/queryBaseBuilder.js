

export class QueryBaseBuilder {
    constructor() {
        this.tableName = null;
    }

    _setTable(tableName) {
        validateTable(tableName);

        this.tableName = tableName;

        return this;
    }
    _getTable() {
        if (!this.tableName) {
            throw new Error("Query table is required.");
        }

        return this.tableName;
    }
    _requireTable() {
        if (!this.tableName) {
            throw new Error("Query table is required.");
        }
    }
}