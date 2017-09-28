Kill the node with the master volume:
`systemctl poweroff`{{execute}}

Check StorageOS has promoted the replica to master, and scheduled another replica to be created on another node:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Health}}\t{{.Volumes}}"`{{execute}}
`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}
