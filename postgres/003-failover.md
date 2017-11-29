Now, let's check that the data was persisted and is accessible on another node.

Start by removing the Postgres container:
`docker kill postgres-dev`{{execute}}

Switch to another node with `ssh root@host02`{{execute T2}} and start a new Postgres instance with `pgdata` mounted:

`docker run -d --name postgres-dev -v pgdata:/var/lib/postgresql/data --volume-driver=storageos -e POSTGRES_PASSWORD=storageos -e PGDATA=/var/lib/postgresql/data/pgdata postgres`{{execute T2}}

Connect to your test database:

`docker exec -it postgres-dev bash`{{execute T2}}

`psql -U postgres`{{execute T2}}

`\c testdb`{{execute T2}}

Insert more data, then check that there are four records in the table:

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) VALUES (4, 'Peaches', 203);`{{execute T2}}

`SELECT * FROM FRUIT;`{{execute T2}}
