import mysql from 'mysql2/promise'

class Database {
    constructor() {
        this.pool = mysql.createPool({
            host: '127.0.0.1',
            user: 'root',
            password: 'Mohamed@99',
            database: 'redr_db'
        })
        console.log("-- databse obj created");
    }
    getPool() {
        return this.pool;
    }
    async testConnection() {
        let connection;
        try {
            connection = this.getPool().getConnection();
            console.log("✅ MySQL connected successfully");

            return true;

        } catch (error) {
            console.error(
                "❌ MySQL connection failed:",
                error.message
            );

        } finally {
            if (connection) (await connection).release()
        }
    }
}





export const database = new Database(); 