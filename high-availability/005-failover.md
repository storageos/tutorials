StorageOS polls every ten seconds to check the state of the nodes. Check StorageOS has promoted the replica to master:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Health}}\t{{.Volumes}}"`{{execute}}

StorageOS will create a new replica on the remaining node and sync the data to it within ~30 seconds:

`storageos volume inspect default/testvol`{{execute}}

You should see that there are now two replicas. One in a decomissioned state,
and one in a healthy or synching state. The decommissioned replica was running
on the node that had it's StorageOS container stopped.
