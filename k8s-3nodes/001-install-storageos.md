In this tutorial, we'll look how to install the StorageOS Cluster Operator. It is a Kubernetes native application developed to deploy and configure StorageOS clusters, and assist with maintenance operations. The operator will deploy a StorageOS cluster based on the configuration specified in the cluster definition.


First we need to install the StorageOS operator using the following yaml manifest.

`kubectl create -f https://github.com/storageos/cluster-operator/releases/download/1.5.0/storageos-operator.yaml`{{execute}}

Verify the Cluster Operator pod status

`kubectl -n storageos-operator get pod -w`{{execute}}

> The READY 1/1 indicates that `storageoscluster` resources can be created. Press `Ctrl+C` to continue once the pod is up.

Create a Secret defining the StorageOS API Username and Password.

`kubectl create -f storageos-secret.yaml`{{execute}}

StorageOS Installation.

`kubectl create -f storageos-cluster.yaml`{{execute}}

Verify StorageOS Installation.

`kubectl -n storageos get pods -w`{{execute}}

> The above command watches the pods created by the Cluster Definition example. Note that pods typically take approximately 65 seconds to enter the Running Phase. Press `Ctrl+C` to continue once the pods are up.

Moreover, you can see more information about the StorageOS Cluster.

`kubectl -n storageos-operator describe storageoscluster`{{execute}}

You can also verify that StorageOS was installed succesfully using the StorageOS CLI.

`storageos node ls`{{execute}}