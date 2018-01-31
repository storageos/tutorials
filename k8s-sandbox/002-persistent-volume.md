Now, a developer is able to request storage via persistent volume claims.

Create PersistentVolumeClaim and a Redis pod which references the `fast` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}
`kubectl create -f storageos-pod.yaml`{{execute}}

You should see a persistent volume, backed by a StorageOS volume:

`kubectl describe pv`{{execute}}

Confirm StorageOS provisioned the volume on `node01`:

`storageos volume ls`{{execute}}
