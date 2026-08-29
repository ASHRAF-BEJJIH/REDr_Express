import { BaseRepository } from "../core/baseRepository.js";

export default class CarRepository extends BaseRepository {
    constructor(db) {
        super(db,"cars")
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