Lets check how to dynamically provision storage using
StorageOS.

During cluster bootstrap StorageOS creates a StorageClass called `fast`. A
StorageClass is a Kubernetes construct that describes different "classes" of
Storage and their providers.

Additional StorageClasses can be created to define different behaviours or apply
feature labels by default.

Lets create two additional StorageClasses for a practical example of how StorageClasses can be used.

Start by creating a StorageClass for development.

```
kubectl create -f-<<END
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: dev
provisioner: csi.storageos.com
parameters:
  csi.storage.k8s.io/fstype: ext4
  pool: default
  csi.storage.k8s.io/node-publish-secret-namespace: kube-system
  csi.storage.k8s.io/provisioner-secret-namespace: kube-system
  csi.storage.k8s.io/controller-publish-secret-namespace: kube-system
  csi.storage.k8s.io/controller-expand-secret-namespace: kube-system
  csi.storage.k8s.io/node-publish-secret-name: csi-node-publish-secret
  csi.storage.k8s.io/provisioner-secret-name: csi-provisioner-secret
  csi.storage.k8s.io/controller-publish-secret-name: csi-controller-publish-secret
  csi.storage.k8s.io/controller-expand-secret-name: csi-controller-expand-secret
END
```{{execute}}

And a StorageClass for production.

```
kubectl create -f- <<END
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: prod
provisioner: csi.storageos.com
parameters:
  csi.storage.k8s.io/fstype: ext4
  pool: default
  storageos.com/replicas: "1" # Enforces 1 replica for any Volume created by this StorageClass
  csi.storage.k8s.io/node-publish-secret-namespace: kube-system
  csi.storage.k8s.io/provisioner-secret-namespace: kube-system
  csi.storage.k8s.io/controller-publish-secret-namespace: kube-system
  csi.storage.k8s.io/controller-expand-secret-namespace: kube-system
  csi.storage.k8s.io/node-publish-secret-name: csi-node-publish-secret
  csi.storage.k8s.io/provisioner-secret-name: csi-provisioner-secret
  csi.storage.k8s.io/controller-publish-secret-name: csi-controller-publish-secret
  csi.storage.k8s.io/controller-expand-secret-name: csi-controller-expand-secret
END
```{{execute}}

Note the additional parameter `storageos.com/replicas: 1`. This parameter will
apply apply a `storageos.com/replicas: 1` label to any volume created with the
`prod` StorageClass causing StorageOS to provision a volume with 1 replica.
This means that 2 synchronous copies of the volumes data are kept on two nodes
in the cluster. The primary volume, where I/O operations are performed by the
application and the replica that keeps in sync from the primary. Having a
replicated volume means that should the node holding the primary volume fail,
the replica volume will be promoted and I/O can continue uninterrupted. For
more information about StorageOS replication please see:
https://docs.storageos.com/docs/concepts/replication/


To see all the available StorageClasses run the command below. Notice that
there are three StorageClasses with the provider: `csi.storageos.com`

`kubectl get sc`{{execute}}

StorageOS feature labels can also be passed as labels in a PVC spec.

For instance, the following would create a Volume with 1 replicas.

```
kubectl create -f- <<END
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-0
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
