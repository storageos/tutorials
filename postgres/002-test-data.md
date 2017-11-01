Connect to Postgres and create a test database:

`docker exec -it postgres-dev bash`{{execute}}

`psql -U postgres`{{execute}}

`CREATE DATABASE testdb;`{{execute}}

`\c testdb;`{{execute}}

Your prompt will switch to `root@[container-id]`, then `postgres=#`, `then testdb=#`.

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

`exit`{{execute}}

`docker kill postgres-dev`{{execute}}
