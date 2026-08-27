import mysql from "mysql2";

const pool = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'myapp'
});

export default pool;