First verify StorageOS Installation.

`kubectl -n kube-system get pods -lapp=storageos -w`{{execute}}

> The above command watches the pods created by the StorageOSCluster resource. Note that pods typically take approximately 40 seconds to enter the Running Phase. Press `Ctrl+C` to continue once the pods are up.

We can use a pod to access the CLI using kubectl exec:

`kubectl -n kube-system run \
--image storageos/cli:v2.1.0 \
--restart=Never                          \
--env STORAGEOS_ENDPOINTS=[[HOST2_IP]]:5705 \
--env STORAGEOS_USERNAME=storageos       \
--env STORAGEOS_PASSWORD=storageos       \
--command cli                            \
-- /bin/sh -c "while true; do sleep 999999; done"`{{execute}}

Wait for the CLI pod to enter the Running state and press `Ctrl+C` to continue once the pod is running.

`kubectl -n kube-system get pods -l run=cli -w`{{execute}}

Verify that you have a healthy installation with three nodes:

`kubectl exec -ti cli -n kube-system -- storageos get node`{{execute}}

We are going to use the default StorageClass that was created when StorageOS was installed, called `fast`.

The `fast` StorageClass is backed by the `storageos`
provisioner:

`kubectl describe storageclass fast`{{execute}}
