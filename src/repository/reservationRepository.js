import { BaseRepository } from "../core/repository/baseRepository.js";

export default class ReservationRepository extends BaseRepository{
    constructor(db) {
        super(db,"reservations")
    }
    
}