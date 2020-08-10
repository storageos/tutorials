Developers can request storage in Kubernetes using Persistent Volume Claims. A
PersistentVolume matching the PersistentVolumeClaim is then created by the
StorageClass specified in the PersistentVolumeClaim.

In order to demonstrate this we will deploy a Redis Server on Kubernetes (as
Redis can persist its state to a persistent volume) with the data being written
to a StorageOS persistent volume.

Create PersistentVolumeClaim and a Redis pod which references the `prod` StorageClass:

```
kubectl create -f- <<END
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: redis-prod-pvc
spec:
  storageClassName: prod
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
END
``` {{execute}}

Check the PVC and PV

`kubectl get pvc`{{execute}} and `kubectl get pv`{{execute}}

> StorageOS dynamically provisions a PV (Persistent Volume) that matches the PVC(Persistent Volume Claim) in size and access modes.

Check the Volume using the StorageOS cli for additional information about the volume such as where the primary volume is located (Location) and the number of Replicas.

`kubectl exec -ti cli -n kube-system -- storageos get volumes`{{execute}}

Because we provisioned a PVC using the `prod` StorageClass, which had the
`storageos.com/replicas: 1` label, we can see that the volume has `1/1`
replicas. This means that the volume has one replica that it is healthy and
ready.

Lets create a Pod that uses the Volume.

```
kubectl create -f- <<END
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: redis
    role: master
  name: redis-persisted
spec:
  containers:
    - name: master
      image: redis:5.0.4
      env:
        - name: MASTER
          value: "true"
      ports:
        - containerPort: 6379
      resources:
        limits:
          cpu: "0.1"
      volumeMounts:
        - mountPath: /redis-master-data
          name: redis-data
  volumes:
    - name: redis-data
      persistentVolumeClaim:
        claimName: redis-prod-pvc # Reference to the PVC above
END
``` {{execute}}

Check the Pod

`kubectl get pod -w`{{execute}}

During Pod provisioning, the StorageOS Volume is mounted in
`/redis-master-data`. You can exec into the container and see the standard
Linux device being used, the device created dynamically by StorageOS.

`kubectl exec redis-persisted -- /bin/sh -c "cd /redis-master-data && df -h ."`{{execute}}

Congratulations, you have successfully installed StorageOS on Kubernetes, created a volume, and bound that volume to an application!


