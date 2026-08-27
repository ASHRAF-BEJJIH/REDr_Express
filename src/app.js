import express from 'express'
import pool from './config/db.js'
import userRoute from './routers/users.route.js'
import authRoute from './routers/auth.routes.js'
const app = express()

app.use(express.json())

app.use("/users", userRoute)


app.use("/api/auth",authRoute)



async function startServer() {
    try {
        const connection = await pool.getConnection();

        console.log("MySQL connected successfully");

        // const [result] = await pool.query("SELECT * FROM users")

        // console.log(result)

        connection.release();

    } catch (error) {
        console.error("MySQL connection failed:", error.message);
    }
}

startServer();

app.listen(8000, (req, res) => { 
    console.log("warah 7na kansm3uk, ghawet mzzyan")
})