In this tutorial, we'll look at how you dynamically provision storage using
StorageOS.

An administrator can create a Storage Class to describe the storage that can
be provisioned.

Create `fast001` StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

The `fast001` StorageClass should be backed by the `kubernetes.io/storageos`
provisioner:

`kubectl describe storageclass fast001`{{execute}}
