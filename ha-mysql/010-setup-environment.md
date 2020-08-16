MySQL is a popular SQL open source database for a wide range of popular
web-based applications. In this tutorial, we'll look at how to configure it
with StorageOS for high availability and failover.

First verify StorageOS Installation.

`kubectl -n kube-system get pods -lapp=storageos -w`{{execute}}

> The above command watches the pods created by the StorageOSCluster resource.
> Note that pods typically take approximately 40 seconds to enter the Running
> Phase. Press `Ctrl+C` to continue once the pods are up.

We can use a pod to access the CLI using kubectl exec:

`kubectl -n kube-system create -f storgeos-cli.yaml`{{execute}}

Wait for the CLI pod to enter the Running state and press `Ctrl+C` to continue
once the pod is running.

`kubectl -n kube-system get pods -l app=storageos-cli -w`{{execute}}

Verify that you have a healthy installation with three nodes:

`kubectl exec cli -n kube-system -- storageos get node`{{execute}}

We are going to use the default StorageClass that was created when StorageOS
was installed, called `fast`.
