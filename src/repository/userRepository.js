
class UserRepository {
    constructor(db) {
        this.db = db
    }
    async getUserById(id) {
        const [rows] = await this.db.query("SELECT * FROM users WHERE id = ?", [id]);
        return rows[0];
    }
    async getAllUsers() {
        const [rows] = await this.db.query("SELECT * FROM users");
        return rows;
    }

    async createUser(user) {
        const { name, email, password } = user;
        const [result] = await this.db.query("INSERT INTO users (name, email, password) VALUES (?, ?, ?)", [name, email, password]);
        return result.insertId;
    }

}