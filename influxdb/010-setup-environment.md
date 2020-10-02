This tutorial requires Kubernetes and StorageOS to be installed. When the installation is complete, you will see the text "StorageOS is ready on hostX".

To verify the installation, run the following command and ensure all pods are ready.

`kubectl -n kube-system get pods -lapp=storageos `{{execute}}

Now we are ready to access the StorageOS CLI. We can use a use a pod for this interaction.

Install the StorageOS CLI in a pod using this command:

`kubectl -n kube-system run \
--image storageos/cli:v2.2.0 \
--restart=Never                          \
--env STORAGEOS_ENDPOINTS=[[HOST2_IP]]:5705 \
--env STORAGEOS_USERNAME=storageos       \
--env STORAGEOS_PASSWORD=storageos       \
--command cli                            \
-- /bin/sh -c "while true; do sleep 999999; done"`{{execute}}

To ensure that the CLI pod has been created successfully,
we can use the following command. Look for the CLI to become "ready"
(use Ctrl + C to exit).

`kubectl -n kube-system get pods -l run=cli -w`{{execute}}

You can use the CLI pod to inspect the StorageOS installation. Exec into the CLI pod and get the nodes in the kube-system namespace.

`kubectl exec -ti cli -n kube-system -- storageos get node`{{execute}}

You now have a succesful and healthy StorageOS installation running on
a Kubernetes cluster. In the next step we will install InfluxDB.