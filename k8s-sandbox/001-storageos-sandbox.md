Verify that you have a master and a worker node (`node01`) running:

`kubectl get nodes`{{execute}}

Create daemonset:

`kubectl apply -f storageos-daemonset.yaml`{{execute}}

Check that a one-node StorageOS cluster has started successfully:

`storageos node ls`{{execute}}

Encode the api address and create secret:

`APIADDRESS=$(echo -n "tcp:/[[HOST2_IP]]:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" storageos-secret.yaml`{{execute}}
`kubectl create -f storageos-secret.yaml`{{execute}}

Create StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

Create PersistentVolumeClaim:

`kubectl create -f storageos-pvc.yaml`{{execute}}

Create Redis pod:

`kubectl create -f storageos-pod.yaml`{{execute}}

============================================================

All files:

`kubectl apply -f storageos-pvc.yaml -f storageos-pod.yaml -f storageos-secret.yaml -f storageos-storageclass.yaml`{{execute}}
