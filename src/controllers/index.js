const { Pool } = require("pg");

const pool = new Pool({
    user: 'postgres',
    host: '127.0.0.1',
    password: '123456',
    database: 'LibraryDB',
    port: '5432'
});

const getAuthors = async (req, res) => {
    const response = await pool.query('SELECT * FROM authors');
    res.status(200).json(response.rows);
};

const getAuthorById = async (req, res) => {
    const id = parseInt(req.params.id);
    const response = await pool.query('SELECT * FROM authors WHERE id = $1', [id]);   
    res.json(response.rows);
};

module.exports = {
    getAuthors,
    getAuthorById
};