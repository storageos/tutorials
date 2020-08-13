Lets check how to dynamically provision storage using
StorageOS.

During cluster bootstrap StorageOS creates a StorageClass called `fast`. A
StorageClass is a Kubernetes construct that describes different "classes" of
Storage and their providers.

Developers can request storage in Kubernetes using Persistent Volume Claims. A
PersistentVolume matching the PersistentVolumeClaim is then created by the
StorageClass specified in the PersistentVolumeClaim.

In order to demonstrate this we will deploy an example Debian pod on Kubernetes with 
a StorageOS persistent volume.

Create PersistentVolumeClaim and a Debian pod which references the `fast` StorageClass:

```
kubectl create -f- <<END
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-1
spec:
  storageClassName: fast
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
END
``` {{execute}}

Check the PVC and PV

`kubectl get pvc`{{execute}} and `kubectl get pv`{{execute}}

> StorageOS dynamically provisions a PV (Persistent Volume) that matches the PVC(Persistent Volume Claim) in size and access modes.

Check the Volume using the StorageOS cli for additional information about the volume such as where the primary volume is located (Location) and the number of Replicas.

`kubectl exec -ti cli -n kube-system -- storageos get volumes`{{execute}}

Now lets create a Pod that uses the Volume.

```
kubectl create -f- <<END
apiVersion: v1
kind: Pod
metadata:
  name: d1
  labels:
    app: debian
spec:
  containers:
    - name: debian
      image: debian:9-slim
      command: ["/bin/sleep"]
      args: [ "3600" ]
      volumeMounts:
        - mountPath: /mnt
          name: v1
  volumes:
    - name: v1
      persistentVolumeClaim:
        claimName: pvc-1

END
``` {{execute}}

Wait for the pod to finish spinning up:

`kubectl get pod -w`{{execute}}

Congratulations, you have successfully installed StorageOS on Kubernetes, created a volume, and bound that volume to an application!