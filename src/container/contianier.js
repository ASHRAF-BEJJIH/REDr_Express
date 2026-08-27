import db from '../config/db.js'
// import UserRepository from '../repository/userRepository.js'
import CarRepository from '../repository/carRepository.js'
import UserService from '../service/userService.service.js'
import CarService from '../service/carService.service.js'


// Repositories

userRepository = new UserRepository(db)
carRepository = new CarRepository(db)



// Services

userService = new UserService(userRepository)
carService = new CarService(carRepository)