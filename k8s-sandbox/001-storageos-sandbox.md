Verify that StorageOS has installed correctly by logging into the worker node:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]`{{execute}}
`storageos node ls`

Now create a volume using the StorageOS provisioner.

Encode the api address and create secret:

`APIADDRESS=$(echo -n "tcp://[[HOST2_IP]]:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" storageos-secret.yaml`{{execute}}
`kubectl create -f storageos-secret.yaml`{{execute}}

Create `fast` StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}
`kubectl get storageclass`{{execute}}

Create PersistentVolumeClaim which references the `fast` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}
`kubectl get pvc`{{execute}}

Create a Redis pod which references `fast0001`:

`kubectl create -f storageos-pod.yaml`{{execute}}
`kubectl get pv`{{execute}}

Confirm the volume was created:
`storageos volume ls`{{execute}}
