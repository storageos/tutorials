For this tutorial we will use the StorageOS CLI to explore the cluster. This is
already installed; run `storageos --help`{{execute}} to see available options.

On start-up, StorageOS nodes communicate with each other to discover the overall
status of the cluster and establish consensus. List the nodes in this cluster:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Capacity}}\t{{.CapacityUsed}}"`{{execute}}

Once the cluster is established, StorageOS creates a default storage pool from all the nodes in the cluster:

`storageos pool ls --format "table {{.Name}}\t{{.Nodes}}\t{{.Total}}\t{{.CapacityUsed}}"`{{execute}}

Note that the total size of the pool is an estimate, but should be approximately the sum of the storage from three nodes.

Inspect the pool for the full JSON configuration:

`storageos pool inspect default`{{execute}}

You should see the name of the three hosts in the storage pool listed under controllerNames.
