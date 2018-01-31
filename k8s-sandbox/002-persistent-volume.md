Now, a developer is able to request storage via persistent volume claims.

Create PersistentVolumeClaim which references the `fast` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}
`kubectl get pvc`{{execute}}

Create a Redis pod which references `fast0001`:

`kubectl create -f storageos-pod.yaml`{{execute}}
`kubectl get pv`{{execute}}

The persistent volume should be backed by the `fast` StorageClass.

Confirm the volume was created and provisioned on `node01`:
`storageos volume ls`{{execute}}
