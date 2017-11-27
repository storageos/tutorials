For this tutorial we will use the StorageOS CLI to explore the cluster. This is
already installed; run `storageos --version`{{execute}} to check.

Open terminals on the second and third hosts (type `yes` when prompted):

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

Use `docker ps`{{execute}} to check that the StorageOS container is running on all three nodes.

On start-up, StorageOS nodes communicate with each other to discover the overall
status of the cluster and establish consensus. Check out the nodes in this cluster:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Capacity}}"`{{execute}}
