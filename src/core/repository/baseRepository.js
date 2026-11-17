import { QueryBuilder } from "../queryBuilder/builders/queryBuilder.js";

export class BaseRepository {
    constructor(db, tableName) {
        this.db = db;
        this.tableName = tableName;
    
    }
    _query() {
        return new QueryBuilder().from(this.tableName);
    }
    async findAll({ where = {}, orderBy = null, limit = null, offset = null } = {}) {
        const { sql, params } = this._query().select(["*"]).where(where)
            .orderBy(orderBy).limit(limit).offset(offset).build()

        const [rows] = await this.db.query(sql, params);
        return rows;
    }

    async findById(id) {
        // const { sql, params } = this._query().where({
        //     where:
        //         builder => builder.)
        const sql = `SELECT * FROM ${this.tableName} WHERE id = ? AND `
        new QueryBuilder().select(["*"]).from(this.tableName).where({ id }).build()



        this._query().select(["*"]).where("status", "=", "available").where("age", ">", 12).where("price", "=", 120)
        this._query().select(["*"]).where({ status: "available", age: { operator: ">", value: 12 } }).orWhere({ price: 120 })
        const [rows] = await this.db.query(`SELECT * FROM ${this.tableName} WHERE id = ?`, [id]);
        return rows[0] ?? 0
    }

    async findOneBy(criteria) {
        const columns = Object.keys(criteria);
        if (columns.length !== 1)
            throw new Error("findOne() requires exactly one criterion")
        const [column] = columns;
        const value = criteria[column]
        const sql = `SELECT * FROM ${this.tableName} 
        where ${column} = ? LIMIT 1`
        const [rows] = await this.db.query(sql, [value])
        return rows[0] ?? null
    }

    async create(data) {
        const columns = Object.keys(data)
        const values = Object.values(data)
        const placeholders = columns.map(column => '?').join(", ")
        const columnNames = columns.join(', ')
        const sql = `INSERT INTO ${this.tableName} (${columnNames}) VALUES (${placeholders})`;
        const [result] = await this.db.query(sql, values);
        return result.insertId;
    }

    async update(id, data) {

    }

    async deleteById(id) {
        const [result] = await this.db.query(`DELETE FROM ${this.tableName} WHERE id = ?`, [id]);
        return result && result.affectedRows > 0
    }

    async deleteWhere(criteria) { }


    async existsById(id) {
        const [rows] = await this.db.query(``);
    }

    async count() {

    }

}