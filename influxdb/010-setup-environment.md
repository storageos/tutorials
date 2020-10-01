This tutorial requires Kubernetes and StorageOS to be installed - the first step
is to wait for this installation to complete. When this is the case, you will
see the text "StorageOS is ready on host X". When you see this, verify that
the StorageOS installation is complete with the following command.

`kubectl -n kube-system get pods -lapp=storageos `{{execute}}

Now that Kubernetes and StorageOS are installed, we are ready to access the
StorageOS CLI. We can use a use a pod for this interaction.

`kubectl -n kube-system run \
--image storageos/cli:v2.2.0 \
--restart=Never                          \
--env STORAGEOS_ENDPOINTS=[[HOST2_IP]]:5705 \
--env STORAGEOS_USERNAME=storageos       \
--env STORAGEOS_PASSWORD=storageos       \
--command cli                            \
-- /bin/sh -c "while true; do sleep 999999; done"`{{execute}}

To ensure that the CLI pod has been created successfully and is running,
we can use the following command, which lists pods in the kube-system namespace
with the label "run" set to "cli", as is the case with the CLI pod. You can
append the "-w" parameter to this command, to watch the output for any changes.
Wait for the CLI pod to enter the Running state, then press `Ctrl+C` to
interrupt and continue.

`kubectl -n kube-system get pods -l run=cli -w`{{execute}}

You can use the CLI pod to inspect the StorageOS installation. To verify
that you have a healthy installation with three nodes, use the following
command to exec into the CLI pod and use the StorageOS CLI to get the nodes
in the kube-system namespace.

`kubectl exec -ti cli -n kube-system -- storageos get node`{{execute}}

You now have a succesful and healthy StorageOS installation running on
a Kubernetes cluster. In the next step we will install InfluxDB.