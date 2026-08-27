
class CarRepository {
    constructor(db) {
        this.db = db;
    }

    async getCarById(id) {
        const [rows] = await this.db.query("SELECT * FROM cars WHERE id = ?", [id]);
        return rows[0];
    }
}