`ssh root@host02`{{execute T2}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T2}}
`ssh root@host03`{{execute T3}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T3}}



`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Health}}\t{{.Volumes}}"`{{execute}}
