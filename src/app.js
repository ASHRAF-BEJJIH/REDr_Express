import express from 'express';

const app = express()

const userRoute = require('./routers/users.route')

app.use(express.json())

app.use("/users", userRoute)

app.listen(8000, (req, res) => { 
    console.log("warah 7na kansm3uk, ghawet mzzyan")
})