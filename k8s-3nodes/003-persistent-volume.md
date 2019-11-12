Developers can request storage using persistent volume claims.

Create PersistentVolumeClaim and a Redis pod which references the `fast001` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}
`kubectl create -f redis-pod.yaml`{{execute}}

You should see a StorageOS persistent volume:

`kubectl describe pv`{{execute}}

Confirm StorageOS provisioned the volume:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Location}}"`{{execute}}

The link between the PersistentVolumeClaim and the Pod comes from the pod
referencing the PersistentVolumeClaim in the pods yaml definition.

Run the command to see the redis-pod definition. 

`cat redis-pod.yaml`{{execute}}

You can see that the PersistentVolumeClaim `claimName` has been set to `redispvc`.

Run the command to see the PersistentVolumeClaim definition. 

`cat storageos-pvc.yaml`{{execute}}

Notice that the PersistentVolumeClaim name is `redispvc` and the storage class used is `fast001`.
