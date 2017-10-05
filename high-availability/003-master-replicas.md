Now we'll look at failover.

Find the node that has the master volume for replicated:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

 To SSH into other hosts:

`ssh root@host02`{{execute T2}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T2}}
`ssh root@host03`{{execute T3}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T3}}

Kill the StorageOS container to simulate the node going offline:
`docker rm -f /storageos`{{execute}}
