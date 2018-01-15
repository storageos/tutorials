Create a secret containing the StorageOS API location and credentials:

`APIADDRESS=$(echo -n "tcp:/[[HOST2_IP]]:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" storageos-secret.yaml`{{execute}}
`kubectl create -f storageos-secret.yaml`{{execute}}

Create service:
`kubectl create -f storageos-secret.yaml`{{execute}}

Create StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

Create PersistentVolumeClaim:

`kubectl create -f storageos-pvc.yaml`{{execute}}

Create Redis pod:

`kubectl create -f storageos-pod.yaml`{{execute}}
