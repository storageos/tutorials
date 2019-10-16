Developers can request storage using persistent volume claims.

Create PersistentVolumeClaim and a MySQL pod which references the `fast` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}
`kubectl create -f mysql-pod.yaml`{{execute}}

You should see a StorageOS persistent volume:

`kubectl describe pv`{{execute}}

Confirm StorageOS provisioned the volume on `node01`:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Location}}"`{{execute}}

The link between the PersistentVolumeClaim and the Pod comes from the pod
referencing the PersistentVolumeClaim in the pods yaml definition.

Run the command to see the mysql-pod definition. 

`cat mysql-pod.yaml`{{execute}}

You can see that the PersistentVolumeClaim claimName has been set to fast0001

Run the command to see the PersistentVolumeClaim definition. 

`cat storageos-pvc.yaml`{{execute}}

Notice that the PersistentVolumeClaim name is fast0001.

Now create a mysql-client pod for connecting to MySQL
`kubectl create -f mysql-client-pod.yaml`{{execute}}


