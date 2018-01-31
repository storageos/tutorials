In this tutorial, we'll look at how an administrator would dynamically provision
storage using the StorageOS provisioner.

Verify that you have a healthy installation with one worker node, `node01`:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]`{{execute}}
`storageos node ls`{{execute}}

Now the administrator can create a Storage Class.

Encode the api address and create secret:

`APIADDRESS=$(echo -n "tcp://[[HOST2_IP]]:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" storageos-secret.yaml`{{execute}}
`kubectl create -f storageos-secret.yaml`{{execute}}

Create `fast` StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}
`kubectl get storageclass`{{execute}}

The `fast` StorageClass should be backed by `kubernetes.io/storageos`.
