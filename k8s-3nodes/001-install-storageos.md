In this tutorial, we'll look how to install Tthe StorageOS Cluster Operator. It is a Kubernetes native application developed to deploy and configure StorageOS clusters, and assist with maintenance operations. The operator will deploy a StorageOS cluster based on the configuration specified in the cluster definition.


First we need to install the StorageOS operator using the following yaml manifest.
`kubectl create -f https://github.com/storageos/cluster-operator/releases/download/1.4.0/storageos-operator.yaml`{{execute}}

Verify the Cluster Operator Pod Status
`kubectl -n storageos-operator get pod`{{execute}}

> The READY 1/1 indicates that `storageoscluster` resources can be created.

Create a Secret defining the StorageOS API Username and Password.
`kubectl create -f storageos-secret.yaml`{{execute}}

StorageOS Installation
`kubectl create -f storageos-cluster.yaml`{{execute}}

Verify StorageOS Installation
kubectl -n storageos get pods -w