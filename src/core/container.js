import { database } from '../config/db.js'
import UserRepository from '../repository/userRepository.js'
import CarRepository from '../repository/carRepository.js'
import ReservationRepository from '../repository/reservationRepository.js'
import UserService from '../service/userService.service.js'
import CarService from '../service/carService.service.js'
import AuthService from '../service/authService.service.js'
import AuthController from '../controller/authController.controller.js'

// Repositories
const userRepository = new UserRepository(database.getPool())
const carRepository = new CarRepository(database.getPool())
const reservationRepository = new ReservationRepository(database.getPool());


// Services
const userService = new UserService(userRepository)
const carService = new CarService(carRepository)
const authService = new AuthService(userRepository)



// Controllers
const authController = new AuthController(authService)



export { authController}