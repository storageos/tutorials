`ssh root@host02`{{execute T2}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T2}}
`ssh root@host03`{{execute T3}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T3}}


For this tutorial we will use the StorageOS CLI to explore the cluster. This is
already installed; run `storageos --help`{{execute}} to see available options.

On start-up, StorageOS nodes communicate with each other to discover the overall
status of the cluster and establish consensus. List the nodes in this cluster:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Capacity}}\t{{.CapacityUsed}}"`{{execute}}

Once the cluster is established, StorageOS creates a default storage pool from all the nodes in the cluster:

`storageos pool ls --format "table {{.Name}}\t{{.Nodes}}\t{{.Total}}\t{{.CapacityUsed}}"`{{execute}}

The pool's capacity should be about the three nodes' aggregated capacity.

Inspect the pool for the full JSON configuration:

`storageos pool inspect default`{{execute}}

You should see the name of the three hosts in the storage pool listed under controllerNames.
