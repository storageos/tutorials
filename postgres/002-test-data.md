Connect to Postgres and create a test database (your prompt will change):

`docker exec -it postgres-dev bash;`{{execute}}

`psql -U postgres;`{{execute}}

`CREATE DATABASE testdb;`{{execute}}

Now connect to the database and insert some sample data:

`\c testdb;`{{execute}}

`CREATE TABLE FRUIT(
  ID INT PRIMARY KEY      NOT NULL,
  INVENTORY      CHAR(25) NOT NULL,
  QUANTITY       INT      NOT NULL
);`{{execute}}

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) VALUES (1, 'Bananas', 132), (2, 'Apples', 165), (3, 'Oranges', 219);`{{execute}}

Check your commands succeeded:

`SELECT * FROM FRUIT;`{{execute}}

Quit the Postgres container:

`\q`{{execute}}

`exit`{{execute}}
