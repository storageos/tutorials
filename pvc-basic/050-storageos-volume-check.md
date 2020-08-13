Check the Volumes using the StorageOS CLI


`kubectl exec cli -n kube-system -- storageos get volumes --all-namespaces`{{execute}}

Because we provisioned PVCs with replication factor of 1, we can see `1/1`.
This means that the volume has one replica which is ready and healthy.

For the volumes in the `dev` Namespace, we can see `0/0`. Indicating that there
are 0 replicas.
