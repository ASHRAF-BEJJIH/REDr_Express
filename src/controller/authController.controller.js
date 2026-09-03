
export default class AuthController {
    constructor(authService) {
        this.authService = authService;
    }
    login = async (req, res) => {
        await this.authService.login({ email: "mohamed@", password: "1234" });
        
        res.status(200).json({ message: "Login successful" });
    }

    register = async (req, res) => {

    }
}