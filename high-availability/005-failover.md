StorageOS polls every ten seconds to check the state of the nodes. Check StorageOS has promoted the replica to master:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Health}}\t{{.Volumes}}"`{{execute}}

StorageOS will create a new replica on the remaining node and sync the data to it within ~30 seconds:

`storageos volume inspect default/testvol`{{execute}}
