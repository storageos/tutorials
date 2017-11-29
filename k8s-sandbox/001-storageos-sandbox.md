Verify that you have a master and a worker (`node01`) node running:

`kubectl get nodes`{{execute}}

Create daemonset:

`kubectl apply -f storageos-daemonset.yaml`{{execute}}

Verify service has started:

`kubectl get svc kubernetes`{{execute}}

Check that a one-node StorageOS cluster has started successfully:

`storageos node ls`{{execute}}

Create API secret:

`kubectl create -f storageos-secret.yaml`{{execute}}

Create StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

Create PersistentVolumeClaim:

`kubectl create -f storageos-pvc.yaml`{{execute}}

Create Redis pod:

`kubectl create -f storageos-pod.yaml`{{execute}}

============================================================

All files:

`kubectl apply -f storageos-pvc.yaml -f storageos-service.yaml -f storageos-pod.yaml -f storageos-secret.yaml -f storageos-storageclass.yaml`{{execute}}
