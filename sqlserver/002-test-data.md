Create a test database:

`docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -U SA -P p@ssw0rd`{{execute}}
`create database testdb;`{{execute}}
`use testdb;`{{execute}}

Create a test table and populate it with some sample data:

`create table inventory (id INT, name NVARCHAR(50), quantity INT)`{{execute}}
`INSERT INTO inventory VALUES (1, 'banana', 150);`{{execute}}
`INSERT INTO inventory VALUES (2, 'orange', 154);`{{execute}}
`SELECT * FROM inventory WHERE quantity > 152;`{{execute}}
