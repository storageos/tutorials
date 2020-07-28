Lets check how to use dynamically provisioned storage using
StorageOS.

StorageOS creates a StorageClass by default, called `fast`. Other StorageClasses can be
created to define different behaviours or apply feature labels by default.

Lets create a StorageClass for development

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

  # Change the Namespace below if StorageOS doesn't run in kube-system
  csi.storage.k8s.io/node-publish-secret-namespace: kube-system
  csi.storage.k8s.io/provisioner-secret-namespace: kube-system
  csi.storage.k8s.io/controller-publish-secret-namespace: kube-system
  csi.storage.k8s.io/node-publish-secret-name: csi-node-publish-secret
  csi.storage.k8s.io/provisioner-secret-name: csi-provisioner-secret
  csi.storage.k8s.io/controller-publish-secret-name: csi-controller-publish-secret
END
```{{execute}}

And a StorageClass for production. Note that we are enabling any volume using
the prod StorageClass to have one replica. Hence, 2 synchronous copies of the
data. The primary volume, where I/O operations are performed by the application
and the replica that keeps in sync from the primary.

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

  # Change the Namespace below if StorageOS doesn't run in kube-system
  csi.storage.k8s.io/node-publish-secret-namespace: kube-system       # Namespace that runs StorageOS Daemonset
  csi.storage.k8s.io/provisioner-secret-namespace: kube-system        # Namespace that runs StorageOS Daemonset
  csi.storage.k8s.io/controller-publish-secret-namespace: kube-system # Namespace that runs StorageOS Daemonset
  csi.storage.k8s.io/node-publish-secret-name: csi-node-publish-secret
  csi.storage.k8s.io/provisioner-secret-name: csi-provisioner-secret
  csi.storage.k8s.io/controller-publish-secret-name: csi-controller-publish-secret
END
```{{execute}}


List the StorageClasses

`kubectl get sc`{{execute}}
