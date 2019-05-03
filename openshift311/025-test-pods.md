## Test pods

In this section, we create a pod that mounts a PVC and writes the string
`Testing StorageOS with Openshift` to a file located on a StorageOS volume.
Once the pod is finished, we start a different pod that mounts the same volume
and prints the data to STDOUT.

Create a pod that writes `Testing StorageOS with Openshift` to a file.

`oc create -f pod-write.yaml`{{execute}}

The pod finishes as soon as the file has been written to. 

Once the pod is in a completed state check the data in the volume by attaching
it to a new pod that will print the  written data to STDOUT.

Wait until the `write` pod finishes.

`until oc get pod write --no-headers | grep -q "Completed"; do echo "Waiting for pod to complete"; sleep 3; done `{{execute}}

`oc delete pod write`{{execute}}

Create the `read` pod. 

`oc create -f pod-read.yaml`{{execute}}

`until oc get pod read --no-headers | grep -q "Completed"; do echo "Waiting for pod to complete"; sleep 3; done `{{execute}}

Check the output of the read pod coming from the persisted volume.

`oc logs read`{{execute}}

You can see that the string `Testing StorageOS with Openshift` has been
persisted between executions. Keep in mind that it wouldn't have mattered if the pod
`read` had run on a different host than the `write` pod as StorageOS can
present volumes across hosts.
