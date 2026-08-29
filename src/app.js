import express from 'express'
import { database } from './config/db.js'
import userRoute from './routers/users.route.js'
import authRoute from './routers/auth.routes.js'
const app = express()

app.use(express.json())

app.use("/users", userRoute)


app.use("/api/auth", authRoute)



database.testConnection()

app.listen(8000, (req, res) => {
    console.log("warah 7na kansm3uk, ghawet mzzyan")
})