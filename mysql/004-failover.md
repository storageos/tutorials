Now, let's check that the data was persisted and is accessible on another node.


Make a note of the location on which the volume got initially prosioned on:
`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

Start by removing the MySQL pod:
`kubectl delete pod mysql`{{execute}}

Get the names and labels of the the cluster's nodes:
`kubectl get nodes --show-labels`{{execute}}

Add a label to the Pod
`kubectl edit pod/mysql`{{execute}}


Switch to another node with `ssh root@host02`{{execute T2}} and start a new MySQL instance with `mysqldata` mounted:

`docker run -d --name mysql-dev \
--volume-driver=storageos \
--volume myslqdata:/var/lib/mysql \
--env MYSQLDATA=/var/lib/mysql \
--env MYSQL_ROOT_PASSWORD=storageos mysql`{{execute T2}}

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



storageos volume update --label-add storageos.com/replicas=1 default/fast001
storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"