On start-up, StorageOS nodes communicate with each other to discover the overall status of the cluster and establish consensus.

`storageos node ls --format "{{.Name}} {{.Capacity}}"`

Once the cluster is established, StorageOS creates a highly available storage pool, with each node contributing storage.

`storageos pool ls --format "{{.Name}} {{.Nodes}} {{ .Total }}"`

In this example, three nodes each contribute to the default storage pool.
