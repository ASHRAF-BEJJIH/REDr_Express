import express from 'express';
import { getUsers } from '../controller/user.controller'

const route = express.Router()

route.get("/", getUsers)

module.exports = route