This sandbox environment is a fully configured three node Kubernetes cluster.

In this tutorial, you will install StorageOS v2, create a StorageClass and use it to claim a persistent volume.

To install StorageOS we will proceed with the following steps:

1. Install etcd as a prerequisite
1. Install StorageOS Cluster Operator. Which is a Kubernetes native application
   developed to deploy and configure StorageOS clusters, and assist with
   maintenance operations. 
1. Create a Secret to define the StorageOS credentials
1. Create the StorageOS Cluster (Custom Resource)
1. Create StorageClasses, PVCs and Pods
