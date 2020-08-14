It can be useful to define feature labels for each PVC instead of using the
StorageClass. You can define StorageOS labels such as replication in the PVC
definition.

For instance, the following would create a Volume with 1 replicas.

```
kubectl create -f- <<END
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-replicated
  labels:
    storageos.com/replicas: "1"
spec:
  storageClassName: dev
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
END
```{{execute}}
