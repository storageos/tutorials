Lets check how to dynamically provision storage using StorageOS.

During cluster bootstrap StorageOS creates a StorageClass called `fast`. A
StorageClass is a Kubernetes construct that describes different "classes" of
Storage and their providers.

Additional StorageClasses can be created to define different behaviours or apply
feature labels by default.

Lets create a StorageClass and provision a PVC (Persistent Volume Claim).

1. Create a StorageClass for development.

    ```
   kubectl create -f-<<END
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: dev
   provisioner: csi.storageos.com
   allowVolumeExpansion: true
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

1. Create a Namespace for development

    `kubectl create namespace dev`{{execute}}

1. Create the PVC in the dev namespace.

    ```
   kubectl create -f- <<END
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: pvc-1
     namespace: dev
   spec:
     storageClassName: dev
     accessModes:
       - ReadWriteOnce
     resources:
       requests:
         storage: 1Gi
   END
    ```{{execute}}

1. Check the PVC

    `kubectl -n dev get pvc`{{execute}}

StorageOS dynamically provisions the PV (Persistent Volume).

`kubectl get pv`{{execute}}
