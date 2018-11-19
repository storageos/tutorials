## Test pods

In this section, we create a pod that mounts a PVC and writes a string to a
file located on a StorageOS volume.
`Testing StorageOS with Openshift` in it. Once the pod is finished, we start a
different pod that mounts the same volume and prints the data to STDOUT.

Create a pod that writes to the pvc. `oc create -f pod-write.yaml`{{execute}}

`oc get pods`{{execute}}

The pod finishes as soon as the file has been written. Let's check the data in
the volume by attaching it to a new pod that will print the  written data to
STDOUT.

Wait until the `write` pod finishes and delete afterwards.

`until [ "$(oc get pods | grep write | grep  -c Completed)" -gt 0  ]; do sleep 1; done `{{execute}}

`oc delete pod write`{{execute}}

Create the `read` pod. 

`oc create -f pod-read.yaml`{{execute}}

Check the output of the read pod coming from the persisted volume.

`oc logs read`{{execute}}

You can see that the string `Testing StorageOS with Openshift` has been
persisted between executions. Any pods can access the data from any host, as
volumes are globally namespaced across the cluster.

Mind that it doesn't matter if the pod `read` would run in a different host of
the pod `write` as StorageOS takes care of it.
