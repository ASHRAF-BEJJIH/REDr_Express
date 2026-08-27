
export default class UserRepository {
    constructor(db) {
        this.db = db
    }
    async getAllUsers() {
        const [rows] = await this.db.query("SELECT * FROM users");
        return rows;
    }
    async getUserById(id) {
        const [rows] = await this.db.query("SELECT * FROM users WHERE id = ?", [id]);
        return rows[0];
    }
    async getUserByEmail(email) {
        const [rows] = await this.db.query("SELECT * FROM users WHERE email = ?", [email]);
        
        return rows[0];
    }

    async createUser(user) {
        const { name, email, password } = user;
        const [result] = await this.db.query("INSERT INTO users (name, email, password) VALUES (?, ?, ?)", [name, email, password]);
        return result.insertId;
    }

}