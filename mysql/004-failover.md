Now, let's check that the data was persisted and is accessible on another node.


Make a note of the location on which the volume got initially prosioned on:
`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.MountedBy}}\t{{.Location}}"`{{execute}}


Add a label to the Volume to create a replica


Connect to your test database:

`docker exec -it mysql-dev bash`{{execute T0}}

`mysql -u root -p;`{{execute T0}}

`USE testdb;`{{execute T0}}

Insert more data, then check that there are four records in the table:

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) VALUES (4, 'Peaches', 203);`{{execute T0}}

`SELECT * FROM FRUIT;`{{execute T0}}

Quit the MySQL container:

`\q`{{execute T0}}

`exit`{{execute T0}}

If you check the location of the volume you will see it has not changed,
despite the volume now being mounted by a different host.

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Status}}\t{{.MountedBy}}\t{{.Location}}"`{{execute}}

In this way you can see that the location of the volume is transparent to the
pod that mounts the volume.
