
export default class AuthService {
    constructor(userRepository) {
        this.userRepository = userRepository;
    }

    async register({ name, email, password }) {

    }
    async login({ email, password }) {
        console.log("Login called");
        const user = await this.userRepository.getUserByEmail(email);
        if (!user) {
            console.log("User not found");
        }
    }
}