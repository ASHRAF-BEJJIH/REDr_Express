import db from '../config/db.js'
import UserRepository from '../repository/userRepository.js'
import CarRepository from '../repository/carRepository.js'
import UserService from '../service/userService.service.js'
import CarService from '../service/carService.service.js'
import AuthService from '../service/authService.service.js'
import AuthController from '../controller/authController.controller.js'

// Repositories
const userRepository = new UserRepository(db)
const carRepository = new CarRepository(db)



// Services
const userService = new UserService(userRepository)
const carService = new CarService(carRepository)
const authService = new AuthService(userRepository)



// Controllers
const authController = new AuthController(authService)



export {  authController }