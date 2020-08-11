Developers can request storage in Kubernetes using Persistent Volume Claims. A
PersistentVolume matching the PersistentVolumeClaim is then created by the
StorageClass specified in the PersistentVolumeClaim.

In order to demonstrate this we will deploy an example Debian pod on Kubernetes with 
the data being written to a StorageOS persistent volume.

Create PersistentVolumeClaim and a Debian pod which references the `prod` StorageClass:

```
kubectl create -f- <<END
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-1
spec:
  storageClassName: prod
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

Check the Pod

`kubectl get pod -w`{{execute}}

During Pod provisioning, the StorageOS Volume is mounted in
`/mnt`. You can exec into the container and create a simple 
'hello world' file that will be added to the StorageOS volume.

`kubectl exec d1 -- /bin/sh -c 'echo Hello World > /mnt/hello'`{{execute}}

You can view the contents of the created file using:

`kubectl exec d1 -- cat /mnt/hello`{{execute}}

As mentioned before, since the pod is using the prod Storage Class,
that means that it has one replica as well. We can test the replica 
functionality by failing the pod and recreating it with the PVC.

First, let's delete the pod:

`kubectl delete pod d1`{{execute}}

And after the pod is deleted, recreate the pod:

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

We can check if the file is still there with:

`kubectl exec d1 -- cat /mnt/hello`{{execute}}

We can try that again without a volume:

```
kubectl create -f- <<END
apiVersion: v1
kind: Pod
metadata:
  name: d2
  labels:
    app: debian
spec:
  containers:
    - name: debian
      image: debian:9-slim
      command: ["/bin/sleep"]
      args: [ "3600" ]
END
``` {{execute}}

Wait for the pod to be ready:

`kubectl get pod -w`{{execute}}

Create the file again:

`kubectl exec d2 -- /bin/sh -c 'echo Hello World > /mnt/hello'`{{execute}}

And delete:

`kubectl delete pod d2`{{execute}}

After deleting, recreate the pod:

```
kubectl create -f- <<END
apiVersion: v1
kind: Pod
metadata:
  name: d2
  labels:
    app: debian
spec:
  containers:
    - name: debian
      image: debian:9-slim
      command: ["/bin/sleep"]
      args: [ "3600" ]
END
``` {{execute}}

And check if the file is still there:

`kubectl exec d2 -- cat /mnt/hello`{{execute}}

Unfortunately in this case, the file is lost.

Congratulations, you have successfully installed StorageOS on Kubernetes, created a volume, and bound that volume to an application!


