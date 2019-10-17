Connect to MySQL and create a test database (your prompt will change):

`kubectl exec -it mysql -- mysql`{{execute}}

`mysql -u root;`{{execute}}

`CREATE DATABASE testdb;`{{execute}}

Now connect to the database and insert some sample data:

`USE testdb;`{{execute}}

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

`exit`{{execute}}