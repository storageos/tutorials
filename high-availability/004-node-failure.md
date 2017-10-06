In this step we'll look at how StorageOS handles node failure and failover.

First, open terminals on the second and third host (type `yes` when prompted):

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

Find the node that has the master volume for replicated:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

Switch to the correct host, then remove the StorageOS container to simulate the node going offline:
`docker rm -f /storageos`{{execute}}
