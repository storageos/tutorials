`ssh root@host02`{{execute T2}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T2}}


`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Health}}\t{{.Volumes}}"`{{execute}}
`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}
