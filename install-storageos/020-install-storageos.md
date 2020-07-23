
First we need to install the StorageOS Operator using the following yaml manifest.

`kubectl create -f https://github.com/storageos/cluster-operator/releases/download/v2.0.0/storageos-operator.yaml`{{execute}}

Verify the Cluster Operator pod status

`kubectl -n storageos-operator get pod -w`{{execute}}

> The READY 1/1 indicates that `storageoscluster` resources can be created. Press `Ctrl+C` to continue once the pod is up.

Create a Secret defining the StorageOS credentials.

```
kubectl create -f- <<END
apiVersion: v1
kind: Secret
metadata:
  name: "storageos-api"
  namespace: "storageos-operator"
  labels:
    app: "storageos"
type: "kubernetes.io/storageos"
data:
  # echo -n '<secret>' | base64
  apiUsername: c3RvcmFnZW9z
  apiPassword: c3RvcmFnZW9z
  # CSI Credentials
  csiProvisionUsername: c3RvcmFnZW9z
  csiProvisionPassword: c3RvcmFnZW9z
  csiControllerPublishUsername: c3RvcmFnZW9z
  csiControllerPublishPassword: c3RvcmFnZW9z
  csiNodePublishUsername: c3RvcmFnZW9z
  csiNodePublishPassword: c3RvcmFnZW9z
END
```{{execute}}

This Secret is referenced from the StorageOS Cluster Resource below and will be used
to create an admin user in StorageOS at bootstrap. Also to set up the CSI
credentials that will be exchanged with the Kubernetes ControlPlane. So
StorageOS and Kubernetes can communicate.

StorageOS Installation.

The following resorce defines the StorageOS Cluster. Many options are available
for configuration. For instance, note the `.spec.kvBackend.address` that indicates
the etcd url, or the `.spec.namespace` that indicates where StorageOS will be
installed. Other options could be configured such as `nodeSelectors` to
indicate that the StorageOS Daemonset should run on a subsection of nodes.

```
kubectl create -f- <<END
apiVersion: "storageos.com/v1"
kind: StorageOSCluster
metadata:
  name: "my-storageos-cluster"
  namespace: "storageos-operator"
spec:
  secretRefName: "storageos-api" # Reference from the Secret created in the previous step
  secretRefNamespace: "storageos-operator"  # Namespace of the Secret
  namespace: "kube-system"
  k8sDistro: "upstream"
  images:
    nodeContainer: "storageos/node:v2.0.0" # StorageOS version
  kvBackend:
    address: '${ETCD_HOST}:2379' # Example address, change for your etcd endpoint
  # address: '10.42.15.23:2379,10.42.12.22:2379,10.42.13.16:2379' # You can set ETCD server ips
  csi:
    enable: true
    deploymentStrategy: deployment
    enableControllerPublishCreds: true
    enableNodePublishCreds: true
    enableProvisionCreds: true
  resources:
    requests:
    memory: "512Mi"
#  nodeSelectorTerms:
#    - matchExpressions:
#      - key: "node-role.kubernetes.io/worker" # Compute node label will vary according to your installation
#        operator: In
#        values:
#        - "true"
END
```{{execute}}

> You can find a Custom Resource definition in https://docs.storageos.com/docs/install/kubernetes/#3-trigger-a-storageos-installation


Verify StorageOS Installation.

`kubectl -n kube-system get pods -lapp=storageos -w`{{execute}}

> The above command watches the pods created by the Cluster Definition example. Note that pods typically take approximately 40 seconds to enter the Running Phase. Press `Ctrl+C` to continue once the pods are up.

StorageOS deploys 3 components. The main one is the Daemonset, then the
csi-helper and storageos-scheduler.

Moreover, you can see more information about the StorageOS Cluster.

`kubectl -n storageos-operator describe storageoscluster my-storageos-cluster`{{execute}}
