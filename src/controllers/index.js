const { Pool } = require("pg");

const pool = new Pool({
    user: 'postgres',
    host: '127.0.0.1',
    password: '123456',
    database: 'LibraryDB',
    port: '5432'
});

const getAuthors = async (req, res) => {
    try{
        const response = await pool.query('SELECT * FROM authors');
        res.json(response.rows);
    }catch(error){
        res.json({error});
    }
};

const getAuthorById = async (req, res) => {
    try{
        const id = parseInt(req.params.id);
        const response = await pool.query('SELECT * FROM authors WHERE id = $1', [id]);  
        res.json(response.rows);
    }catch(error){
        console.log(error);
        res.json({error});
    }
};

//Top 10 de autores por ventas
const getTopAuthors = async (req, res) => {
    try {
        const response = await pool.query(`SELECT authors.name, SUM(VENTAS) AS INGRESO_VENTA FROM
        (SELECT books.author_id, quantity*item_price AS VENTAS FROM books INNER JOIN sale_items ON books.id = sale_items.book_id)
        AS T1 INNER JOIN authors ON T1.author_id = authors.id GROUP BY authors.name ORDER BY INGRESO_VENTA DESC LIMIT 10;`);
        res.json(response.rows);
    } catch (error) {
        console.log(error);
        res.json({error});
    }
};

//top "count" autores
const getTopAuthorsByCount = async (req, res) => {
    try {
        const count = parseInt(req.params.count);
        const response = await pool.query(`SELECT authors.name, SUM(VENTAS) AS INGRESO_VENTA FROM
        (SELECT books.author_id, quantity*item_price AS VENTAS FROM books INNER JOIN sale_items ON books.id = sale_items.book_id)
        AS T1 INNER JOIN authors ON T1.author_id = authors.id GROUP BY authors.name ORDER BY INGRESO_VENTA DESC LIMIT $1;`,[count]);
        res.json(response.rows);
    } catch (error) {
        console.log(error);
        res.status(404).json({
            status: 'Error',
            message: "el parametro 'count' no debe ser negativo"
        });
    }
};

module.exports = {
    getAuthors,
    getAuthorById,
    getTopAuthors,
    getTopAuthorsByCount
};