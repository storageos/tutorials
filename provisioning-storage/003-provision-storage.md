You can create a StorageOS volume through the CLI, GUI or via the API.

Try creating a volume:

`storageos volume create myvol`{{execute}}

Since we didn't specify any specific size or storage features for the new
volume, StorageOS uses the default settings. Let's find out what these
settings are:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Location}}"`{{execute}}

`NAMESPACE/NAME`: Namespaces help different projects or teams share a StorageOS
cluster. Note that default refers to the default namespace that StorageOS
created for myvol, rather than the default pool.

`SIZE`: The default volume size is 5GB.

`LOCATION`: The host that StorageOS provisioned the volume on.

StorageOS volumes are thinly provisioned, so storage is dynamically allocated
to volumes as it is used. However volumes must be able to fit on a single node
in the cluster. This is a design choice to ensure deterministic performance.
However it is possible to [overcommit pool
capacity](https://docs.storageos.com/docs/operations/overcommitment) and in
this way you can create volumes that are larger than the underlying node.

You can use see the volume that you created in the GUI. You can also
create and delete volumes using the GUI.

https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/#/volumes

