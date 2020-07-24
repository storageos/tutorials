StorageOS has a CLI and GUI. We are using the CLI to verify the installation.


Run the StorageOS CLI pod:

`kubectl -n kube-system run \
--image storageos/cli:v2.1.0 \
--restart=Never                          \
--env STORAGEOS_ENDPOINTS=[[HOST2_IP]]:5705 \
--env STORAGEOS_USERNAME=storageos       \
--env STORAGEOS_PASSWORD=storageos       \
--command cli                            \
-- /bin/sh -c "while true; do sleep 999999; done"`{{execute}}

Run the following commands to check the nodes and make sure the CLI is working:

`kubectl exec -ti cli -n kube-system -- storageos get nodes`{{execute}}

`kubectl exec -ti cli -n kube-system -- storageos describe nodes`{{execute}}

`kubectl exec -ti cli -n kube-system -- storageos get nodes -oyaml`{{execute}}

