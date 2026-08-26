const express = require('express')
const { getUsers } = require('../controller/user.controller')

const route = express.Router()

route.get("/", getUsers)

module.exports = route