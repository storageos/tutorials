Connect to each MySQL and create a test database (your prompt will change).

Start with the ephemeral MySQL pod:

`kubectl exec -it mysql-ephemeral -- mysql`{{execute}}

`CREATE DATABASE shop;`{{execute}}

Now connect to the database and insert some sample data:

`USE shop;`{{execute}}

`CREATE TABLE FRUIT(
  ID INT PRIMARY KEY      NOT NULL,
  INVENTORY      VARCHAR(25) NOT NULL,
  QUANTITY       INT      NOT NULL
);`{{execute}}

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) 
VALUES 
(1, 'Bananas', 132), 
(2, 'Apples', 165), 
(3, 'Oranges', 219);`{{execute}}

Check your commands succeeded:

`SELECT * FROM FRUIT;`{{execute}}

Quit the MySQL container:

`\q`{{execute}}

Then continue with the persistent one:


`kubectl exec -it mysql-persistent -- mysql`{{execute}}

`CREATE DATABASE shop;`{{execute}}

Now connect to the database and insert some sample data:

`USE shop;`{{execute}}

`CREATE TABLE FRUIT(
  ID INT PRIMARY KEY      NOT NULL,
  INVENTORY      VARCHAR(25) NOT NULL,
  QUANTITY       INT      NOT NULL
);`{{execute}}

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) 
VALUES 
(1, 'Bananas', 132), 
(2, 'Apples', 165), 
(3, 'Oranges', 219);`{{execute}}

Check your commands succeeded:

`SELECT * FROM FRUIT;`{{execute}}

Quit the MySQL container:

`\q`{{execute}}
