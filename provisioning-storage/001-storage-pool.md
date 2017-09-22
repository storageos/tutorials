For this tutorial we will use the StorageOS CLI to explore the cluster. This is
already installed; run `storageos --help`{{execute}} to see available options.

Take a look at the nodes in this cluster:

`storageos node ls --format "{{.Name}} {{.Capacity}}"`{{execute}}

On start-up, StorageOS nodes communicate with each other to discover the overall
status of the cluster and establish consensus.

Once the cluster is established, StorageOS creates a single storage pool called
`default` from all the nodes in the cluster.

Look at the pool:

`storageos pool ls --format "{{.Name}} {{.Nodes}} {{.Total}}"`{{execute}}

The total is an estimate, but should be approximately the sum of the storage from three nodes.

Inspect the pool for more detail:

`storageos pool inspect default`{{execute}}
