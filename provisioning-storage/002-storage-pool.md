Once the cluster is established, StorageOS creates a default storage pool from all the nodes in the cluster:

`storageos pool ls --format "table {{.Name}}\t{{.Nodes}}\t{{.Total}}"`{{execute}}

Each node contributes about 15GB to the pool, so the pool has 45GB of total capacity.

You can see more detail about the pool by inspecting the JSON configuration:

`storageos pool inspect default`{{execute}}

The storage pool contains `host01`, `host02` and `host03` under `controllerNames`.
