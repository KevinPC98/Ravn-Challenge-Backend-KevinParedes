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
