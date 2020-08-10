This sandbox environment contains a fully configured three node Kubernetes cluster.

In this tutorial, you will install StorageOS v2, create a StorageClass and use it to create a persistent volume.

To install StorageOS we will proceed with the following steps:

1. Install etcd as a prerequisite
1. Install the StorageOS Cluster Operator, a Kubernetes native application
   developed to deploy and configure StorageOS clusters, and assist with
   maintenance operations.
1. Create a Secret defining the StorageOS credentials
1. Create a StorageOS Cluster (Custom Resource)
1. Create StorageClasses, PersistentVolumeClaims and Pods
