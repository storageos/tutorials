MySQL is a popular SQL open source database for a wide range of popular web-based applications. In this tutorial, we'll look at how to configure it with StorageOS for high availability and failover.

First we need to set the environment variables that allow us to connect to the
StorageOS cluster. 

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]`{{execute}}

Verify that you have a healthy installation with three nodes:

`storageos node ls`{{execute}}

We are going to use the default StorageClass that was created when StorageOS was installed, called `fast`.

The `fast` StorageClass is backed by the `storageos`
provisioner:

`kubectl describe storageclass fast`{{execute}}
