# Ravn-Challenge-Backend-KevinParedes

La base de datos fue implementada en Postgres la cual estaba alojada en un contenedor de Docker.

## Datos insertados
INSERT INTO authors VALUES <br/> 
(0,'Mario Vargas','1936/03/28'), <br/>
(1,'Claudia Hérnandez','1975/07/22'), <br/>
(2,'César Vallejo','1892/03/16'), <br/>
(3,'Gabriel Marquez','1927/03/06'), <br/>
(4,'Octavio Paz','1914/03/31'), <br/>
(5,'Julio Cortázar','1914/08/26'), <br/>
(6,'Isabel Allende','1942/08/02'), <br/>
(7,'Jorge Borges','1899/08/24'), <br/>
(8,'Lorelai Gilmore','1968/04/25'), <br/>
(9,'Natalia Borges','1981/08/06'), <br/>
(10, 'Carlos Tavarez', '1900/02/09'); <br/>

INSERT INTO books VALUES  <br/>
(0,0,'123'), <br/>
(1,0,'234'), <br/>
(2,1,'345'), <br/>
(3,1,'456'), <br/>
(4,2,'567'), <br/>
(5,2,'678'), <br/>
(6,3,'789'), <br/>
(7,3,'912'), <br/>
(8,4,'987'), <br/>
(9,4,'876'), <br/>
(10,5,'765'), <br/>
(11,5,'654'), <br/>
(12,6,'543'), <br/>
(13,6,'432'), <br/>
(14,7,'321'), <br/>
(15,7,'219'), <br/>
(16,8,'012'), <br/>
(17,8,'120'), <br/>
(18,9,'909'), <br/>
(19,9,'090'), <br/>
(20,10,'X1X'); <br/>

INSERT INTO sale_items VALUES  <br/>
(0,0,'name0',12.2,7), <br/>
(1,1,'name1',10.5,5), <br/>
(2,2,'name2',7.3,10), <br/>
(3,3,'name3',15.0,5), <br/>
(4,4,'name4',8.3,4), <br/>
(5,5,'name5',10.0,5), <br/>
(6,6,'name6',5.1,8), <br/>
(7,7,'name7',23.2,2), <br/>
(8,8,'name8',13.5,6), <br/>
(9,9,'name9',18.0,4), <br/>
(10,10,'name10',20.5,6), <br/>
(11,11,'name11',13.5,6), <br/>
(12,12,'name12',2.5,2), <br/>
(13,13,'name13',23.8,4), <br/>
(14,14,'name14',13.3,7), <br/>
(15,15,'name15',8.0,7), <br/>
(16,16,'name16',21.0,2), <br/>
(17,17,'name17',17.6,7), <br/>
(18,18,'name18',14.2,8), <br/>
(19,19,'name19',1.5,12), <br/>
(20,20,'name20',0.5,1); <br/>

Pregunta N°1 : Who are the first 10 authors ordered by date_of_birth? <br/>
SELECT * FROM authors ORDER BY date_of_birth; <br/>
 <br/>
Pregunta N°2 : What is the sales total for the author named “Lorelai Gilmore”? <br/>
SELECT authors.name, SUM(VENTAS) AS VENTA_TOTAL FROM <br/>
(SELECT books.author_id, quantity*item_price AS VENTAS FROM books INNER JOIN sale_items ON books.id = sale_items.book_id) <br/>
AS T1 INNER JOIN authors ON T1.author_id = authors.id WHERE authors.name = 'Lorelai Gilmore' GROUP BY authors.name ORDER BY VENTA_TOTAL ; <br/>
 <br/>
Pregunta N°3 : What are the top 10 performing authors, ranked by sales revenue? <br/>
SELECT authors.name, SUM(VENTAS) AS INGRESO_VENTA FROM <br/>
(SELECT books.author_id, quantity*item_price AS VENTAS FROM books INNER JOIN sale_items ON books.id = sale_items.book_id) <br/>
AS T1 INNER JOIN authors ON T1.author_id = authors.id GROUP BY authors.name ORDER BY INGRESO_VENTA DESC LIMIT 10 ; <br/>
