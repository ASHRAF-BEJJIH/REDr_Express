import express from 'express';
import { authController } from '../container/container.js'
const router = express.Router();

router.get('/login',authController.login);


export default router;