import { BaseRepository } from "../core/baseRepository.js";

export default class UserRepository extends BaseRepository {
    constructor(db) {
        super(db, "users")
    }
    async findByEmail(email) {
        return this.findOne({ email })
    }
}