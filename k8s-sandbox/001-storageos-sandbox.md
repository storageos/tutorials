See nodes:

`kubectl get nodes`{{execute}}

Create daemonset:

`kubectl apply -f storageos-daemonset.yaml`{{execute}}

Verify service has started:

`kubectl get svc kubernetes`{{execute}}

Check that a one-node StorageOS cluster has started successfully:

`storageos node ls`{{execute}}

Create API secret:

`echo -n "tcp:/[[HOST2_IP]]:5705" | base64`{{execute}}

Replace `apiAddress` field in storageos-secret.yaml with the encoded value.

`kubectl create -f storageos-secret.yaml`{{execute}}

Create StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

Create PersistentVolumeClaim:

`kubectl create -f storageos-pvc.yaml`{{execute}}

Create Redis pod:

`kubectl create -f storageos-pod.yaml`{{execute}}


Everything:

`kubectl apply -f storageos-pvc.yaml -f storageos-service.yaml -f storageos-pod.yaml -f storageos-secret.yaml -f storageos-storageclass.yaml`{{execute}}
