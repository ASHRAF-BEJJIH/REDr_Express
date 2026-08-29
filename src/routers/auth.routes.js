import express from 'express';
import { authController } from '../core/container.js'
const router = express.Router();

router.get('/login',  authController.login);

router.post('/register', authController.register);

export default router;