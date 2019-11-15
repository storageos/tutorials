Developers can request storage using persistent volume claims. In order to demonstrate this
we will deploy a Redis Server on Kubernetes (as Redis can persist its state to a persistent volume) with the data being written to a StorageOS persistent volume.

Create PersistentVolumeClaim and a Redis pod which references the `fast001` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}
`kubectl create -f redis-pod.yaml`{{execute}}

You should see a StorageOS persistent volume:

`kubectl describe pv`{{execute}}

> Usually takes ~30 seconds to come up after it's been created.

Confirm StorageOS provisioned the volume:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Location}}"`{{execute}}

The link between the PersistentVolumeClaim and the pod comes from the pod
referencing the PersistentVolumeClaim in the pods yaml definition.

Run the following command to see the redis-pod definition. 

`cat redis-pod.yaml`{{execute}}

You can see that the PersistentVolumeClaim `claimName` has been set to `redispvc`.

Run the following command to see the PersistentVolumeClaim definition. 

`cat storageos-pvc.yaml`{{execute}}

Notice that the PersistentVolumeClaim name is `redispvc` and the storage class used is `fast001`.
