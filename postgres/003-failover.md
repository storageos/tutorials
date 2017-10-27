Now, let's check that the data was persisted and is accessible on another node.

Switch to another node with `ssh root@host02`{{execute T2}} and start a new Postgres container with the same volume mounted:

`docker run -d --name postgres-dev -v pgdata:/var/lib/postgresql/data --volume-driver=storageos \
    -e POSTGRES_PASSWORD=storageos -e PGDATA=/var/lib/postgresql/data/pgdata postgres`{{execute T2}}

Check that you can connect to the database and insert some more data:

`docker exec -it postgres-dev bash`{{execute T2}}
`\l`{{execute T2}}
`\c testdb`{{execute T2}}
`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) VALUES (4, 'Peaches', 203);`{{execute T2}}
`SELECT * FROM FRUIT;`{{execute T2}}
`\q`{{execute T2}}
`exit`{{execute T2}}
