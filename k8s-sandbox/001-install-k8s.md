Verify that you have a master and a worker node (`node01`) running:

`kubectl get nodes`{{execute}}

Create daemonset:

`kubectl apply -f storageos-daemonset.yaml`{{execute}}

Use the StorageOS CLI to check that a one-node StorageOS cluster has started successfully:

`storageos node ls`{{execute}}
