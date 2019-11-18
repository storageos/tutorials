Now, let's check that the data was persisted and is accessible on another node.

Make a note of the location on which the volume got initially prosioned on:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.MountedBy}}\t{{.Location}}"`{{execute}}

Save the namespace/volume into a variable.

`volume=$(storageos volume ls --format "table {{.Name}}\t{{.Replicas}}" | grep '0/0' | awk '{ print $1 }')`{{execute}}

Create 1 replica for the volume, by adding a label to the volume.

`storageos volume update --label-add storageos.com/replicas=1 $volume`{{execute}}

Check that the replica was created.

`storageos volume ls --format "table {{.Name}}\t{{.Replicas}}"`{{execute}}

In order to keep this tutorial simple, we are going to delete the MySQL pod and create it on a different in our cluster

`kubectl delete pod mysql`{{execute}}

Switch to another node in the cluster and create the MySQL pod again.

`kubectl create -f mysql-pod2.yaml`{{execute}}

set the environment variables that allow us to connect to the
StorageOS cluster on the new terminal tab.

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]`{{execute}}

`kubectl get pods -w`{{execute}}

> The above command watches the pod created in the default namespace. Press `Ctrl+C` to continue once the pods are up.

Connect to your test database:

`kubectl exec -it mysql -- mysql`{{execute}}

`USE testdb;`{{execute}}

Insert more data, then check that there are four records in the table:

`INSERT INTO FRUIT (ID,INVENTORY,QUANTITY) VALUES (4, 'Peaches', 203);`{{execute}}

`SELECT * FROM FRUIT;`{{execute}}

Quit the MySQL container:

`\q`{{execute}}

Now we are going to cordon and drain the node which the 
If you check the location of the volume you will see it has not changed,
despite the volume now being mounted by a different host.

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Status}}\t{{.MountedBy}}\t{{.Location}}"`{{execute}}

In this way you can see that the location of the volume is transparent to the
pod that mounts the volume.

Congratulations, you have successfully installed StorageOS on Kubernetes, created a volume, and bound that volume to an application!