
export default class CarRepository {
    constructor(db) {
        this.db = db;
    }

    async getCars() {
        const [rows] = await this.db.query("SELECT * FROM cars");
        return rows;
    }
    async getCarById(id) {
        const [rows] = await this.db.query("SELECT * FROM cars WHERE id = ?", [id]);
        return rows[0];
    }

    async createCar(car) {

    }
}