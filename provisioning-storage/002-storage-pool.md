Once the cluster is established, StorageOS creates a default storage pool, by
aggregating storage from the underlying nodes in the cluster.

`storageos pool ls --format "table {{.Name}}\t{{.Nodes}}\t{{.Total}}"`{{execute}}

Each node contributes about 47GB to the pool, so the pool has 142GB of total capacity.

You can see more detail about the pool by inspecting the JSON configuration:

`storageos pool inspect default`{{execute}}

The storage pool contains `host01`, `host02` and `host03` under `name`

You can also view and modify storage pools from the GUI
https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/#/pools

