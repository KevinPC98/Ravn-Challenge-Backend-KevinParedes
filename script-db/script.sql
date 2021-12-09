CREATE DATABASE "LibraryDB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE authors (
	id serial PRIMARY KEY,
	name text,
	date_of_birth timestamp
);

CREATE TABLE books (
	id serial PRIMARY KEY,
	author_id integer REFERENCES authors (id),
	isbn text
);

CREATE TABLE sale_items (
	id serial PRIMARY KEY,
	book_id integer REFERENCES books (id),
	customer_name text,
	item_price money,
	quantity integer
);

INSERT INTO authors VALUES 
(0,'Mario Vargas','1936/03/28'),
(1,'Claudia Hérnandez','1975/07/22'),
(2,'César Vallejo','1892/03/16'),
(3,'Gabriel Marquez','1927/03/06'),
(4,'Octavio Paz','1914/03/31'),
(5,'Julio Cortázar','1914/08/26'),
(6,'Isabel Allende','1942/08/02'),
(7,'Jorge Borges','1899/08/24'),
(8,'Lorelai Gilmore','1968/04/25'),
(9,'Natalia Borges','1981/08/06'),
(10, 'Carlos Tavarez', '1900/02/09');

INSERT INTO books VALUES 
(0,0,'123'),
(1,0,'234'),
(2,1,'345'),
(3,1,'456'),
(4,2,'567'),
(5,2,'678'),
(6,3,'789'),
(7,3,'912'),
(8,4,'987'),
(9,4,'876'),
(10,5,'765'),
(11,5,'654'),
(12,6,'543'),
(13,6,'432'),
(14,7,'321'),
(15,7,'219'),
(16,8,'012'),
(17,8,'120'),
(18,9,'909'),
(19,9,'090'),
(20,10,'X1X');


INSERT INTO sale_items VALUES 
(0,0,'name0',12.2,7),
(1,1,'name1',10.5,5),
(2,2,'name2',7.3,10),
(3,3,'name3',15.0,5),
(4,4,'name4',8.3,4),
(5,5,'name5',10.0,5),
(6,6,'name6',5.1,8),
(7,7,'name7',23.2,2),
(8,8,'name8',13.5,6),
(9,9,'name9',18.0,4),
(10,10,'name10',20.5,6),
(11,11,'name11',13.5,6),
(12,12,'name12',2.5,2),
(13,13,'name13',23.8,4),
(14,14,'name14',13.3,7),
(15,15,'name15',8.0,7),
(16,16,'name16',21.0,2),
(17,17,'name17',17.6,7),
(18,18,'name18',14.2,8),
(19,19,'name19',1.5,12),
(20,20,'name20',0.5,1);

SELECT *FROM authors;
SELECT *FROM books;
SELECT *FROM sale_items;
SELECT * FROM authors WHERE id = 1;

-- Pregunta N°1
-- 1. Who are the first 10 authors ordered by date_of_birth?
SELECT * FROM authors ORDER BY date_of_birth;
-- Pregunta N°2
-- 2. What is the sales total for the author named “Lorelai Gilmore”?
SELECT authors.name, SUM(VENTAS) AS VENTA_TOTAL FROM
(SELECT books.author_id, quantity*item_price AS VENTAS FROM books INNER JOIN sale_items ON books.id = sale_items.book_id)
AS T1 INNER JOIN authors ON T1.author_id = authors.id WHERE authors.name = 'Lorelai Gilmore' GROUP BY authors.name ORDER BY VENTA_TOTAL ;
-- Pregunta N°3
-- 3. What are the top 10 performing authors, ranked by sales revenue?
SELECT authors.name, SUM(VENTAS) AS INGRESO_VENTA FROM
(SELECT books.author_id, quantity*item_price AS VENTAS FROM books INNER JOIN sale_items ON books.id = sale_items.book_id)
AS T1 INNER JOIN authors ON T1.author_id = authors.id GROUP BY authors.name ORDER BY INGRESO_VENTA DESC LIMIT 10 ;

