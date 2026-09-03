
export default class AuthService {
    constructor(userRepository) {
        this.userRepository = userRepository;
    }

    async register({ name, email, password }) {
        // const existingUser = await 
    }
    async login({ email, password }) {
        console.log("Login called");
        const user = await this.userRepository.findByEmail(email);
        console.log(user)
        if (!user) {
            console.log("User not found");
        }
    }
}