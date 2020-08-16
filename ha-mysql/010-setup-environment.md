MySQL is a popular SQL open source database for a wide range of popular
web-based applications. In this tutorial, we'll look at how to configure it
with StorageOS for high availability and failover.

First verify StorageOS Installation.

`kubectl -n kube-system get pods -lapp=storageos -w`{{execute}}

> The above command watches the pods created by the StorageOSCluster resource.
> Note that pods typically take approximately 40 seconds to enter the Running
> Phase. Press `Ctrl+C` to continue once the pods are up.

Verify that you have a healthy installation with three nodes:

`storageos get node`{{execute}}

We are going to use the default StorageClass that was created when StorageOS
was installed, called `fast`.
