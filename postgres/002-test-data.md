Connect to Postgres and create a test database:

`docker exec -it postgres-dev bash`{{execute}}
`CREATE DATABASE testdb;`{{execute}}
`\c testdb;`{{execute}}
`CREATE TABLE FRUIT(
  ID INT PRIMARY KEY      NOT NULL,
  INVENTORY      CHAR(25) NOT NULL,
  QUANTITY       INT      NOT NULL
);`{{execute}}
`\d`{{execute}}

Insert sample data:

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) VALUES (1, 'Bananas', 132), (2, 'Apples', 165), (3, 'Oranges', 219);`{{execute}}
`SELECT * FROM FRUIT;`{{execute}}

Quit and kill the Postgres container:

`\q`{{execute}}
`docker kill postgres-dev`{{execute}}
