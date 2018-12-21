In this step we'll look at how StorageOS handles node failure and failover.

Find the node that has the master volume for replicated:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

Switch to the correct host, then stop the StorageOS container to simulate the node going offline:
`docker stop -t 0 storageos`{{execute}}
