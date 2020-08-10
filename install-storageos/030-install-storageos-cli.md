StorageOS has a CLI and GUI. We are using the CLI to verify the installation.


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

Run the following commands to check the nodes and make sure the CLI is working:

`kubectl exec -ti cli -n kube-system -- storageos get nodes`{{execute}}

The above command will display the three nodes that are in the StorageOS
cluster. Note that these three nodes are identical to the nodes in the
Kubernetes cluster.

You can verify this by getting the Kubernetes nodes.

`kubectl get nodes`{{execute}}
