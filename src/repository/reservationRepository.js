import { BaseRepository } from "../core/baseRepository.js";

export default class ReservationRepository extends BaseRepository{
    constructor(db) {
        super(db,"reservations")
    }
    
}