We can create a second StorageClass for production.

1. Creating a StorageClass for production

    ```
   kubectl create -f- <<END
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: prod
   provisioner: csi.storageos.com
   allowVolumeExpansion: true
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
    apply a `storageos.com/replicas: 1` label to any volume created with the
    `prod` StorageClass causing StorageOS to provision a volume with 1 replica.
    This means that 2 synchronous copies of the volume data are kept on two nodes
    in the cluster. The primary volume, where I/O operations are performed by the
    application and the replica that keeps in sync from the primary. Having a
    replicated volume means that should the node holding the primary volume fail,
    the replica volume will be promoted and I/O can continue uninterrupted. For
    more information about StorageOS replication please see:
    https://docs.storageos.com/docs/concepts/replication/

2. Create a Namespace for production

    `kubectl create namespace prod`{{execute}}

3. Create the PVC in the prod namespace.

    ```
   kubectl create -f- <<END
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: pvc-1
     namespace: prod
   spec:
     storageClassName: prod
     accessModes:
       - ReadWriteOnce
     resources:
       requests:
         storage: 1Gi
   END
    ```{{execute}}

4. Check the PVC

    `kubectl -n prod get pvc`{{execute}}
