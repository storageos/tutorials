In this tutorial, we'll look at how you dynamically provision storage using
StorageOS.

Verify that you have a healthy installation with one worker node, `node01`:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]`{{execute}}
`storageos node ls`{{execute}}

Now an administrator can create a Storage Class to describe the storage that can
be provisioned.

Encode the api address of the worker node in a secret:

`APIADDRESS=$(echo -n "tcp://[[HOST2_IP]]:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" storageos-secret.yaml`{{execute}}
`kubectl create -f storageos-secret.yaml`{{execute}}

Create `fast` StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

The `fast` StorageClass should be backed by the `kubernetes.io/storageos`
provisioner:

`kubectl describe storageclass`{{execute}}
