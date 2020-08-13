
1. Install StorageOS Operator

    `kubectl create -f https://github.com/storageos/cluster-operator/releases/download/v2.1.0/storageos-operator.yaml`{{execute}}

    Wait until the Pod is ready `kubectl -n storageos-operator get pod -w`{{execute}}

    > The READY 1/1 indicates that `storageoscluster` resources can be created.
    > Press `Ctrl+C` to continue once the pod is up.

1. Create a Secret defining the StorageOS credentials

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
     csiControllerExpandUsername: c3RvcmFnZW9z
     csiControllerExpandPassword: c3RvcmFnZW9z
   END
    ```{{execute}}

1. Create StorageOSCluster definition

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
       nodeContainer: "storageos/node:v2.1.0" # StorageOS version
     kvBackend:
       address: '${ETCD_HOST}:2379' # Example address, change for your etcd endpoint
     # address: '10.42.15.23:2379,10.42.12.22:2379,10.42.13.16:2379' # You can set ETCD server ips
     csi:
       enable: true
       deploymentStrategy: deployment
       enableControllerPublishCreds: true
       enableNodePublishCreds: true
       enableProvisionCreds: true
       enableControllerExpandCreds: true
   END
    ```{{execute}}

    > For additional information on the configuration options exposed by the
    > StorageOSCluster resource, see:
    > https://docs.storageos.com/docs/reference/cluster-operator/configuration/


### Verify installation

`kubectl -n kube-system get pods -lapp=storageos -w`{{execute}}

> Wait until StorageOS Pods are ready. Note that pods typically take
> approximately 40 seconds to enter the Running Phase. Press `Ctrl+C` to
> continue once the pods are up.


Once the pods are all in the Running state the installation is complete! You
have created a StorageOS cluster.

The last step is to license the cluster. You will license this cluster in
following steps using the StorageOS GUI.
