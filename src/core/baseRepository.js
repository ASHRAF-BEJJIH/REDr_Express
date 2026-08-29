export class BaseRepository {
    constructor(db, tableName) {
        this.db = db;
        this.tableName = tableName;

    }

    async findAll({ where = {}, orderBy = null, limit = null, offset = null } = {}) {
        const [rows] = await this.db.query(`SELECT * FROM ${this.tableName}`);
        return rows;
    }

    async findById(id) {
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

    async deleteWhere(criteria) {}


    async existsById(id) {
        const [rows] = await this.db.query(``);
    }

    async count() {

    }

}