
export default class CarController {
    constructor(carService) {
        this.carService = carService;
    }

    getCars = async (req, res) => {
        this.carService.getCars()
    }

    getCarById = async (req, res) => {

    }

    createCar = async (req, res) => {

    }

}