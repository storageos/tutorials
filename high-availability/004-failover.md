Check StorageOS has promoted the replica to master:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Health}}\t{{.Volumes}}"`{{execute}}

You should see a new replica being created and synced within ~30 seconds.

`storageos volume inspect default/replicated`
