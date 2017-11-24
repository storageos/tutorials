Applications can create a StorageOS volume through the CLI, API or GUI. Try creating a volume:

`storageos volume create myvol`{{execute}}

Since we didn't specify any specific size or storage features for the new
volume, StorageOS uses the default settings. Let's find out what these
settings are:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Location}}"`{{execute}}

`NAMESPACE/NAME`: Namespaces help different projects or teams share a StorageOS cluster. Note that default refers to the default namespace that StorageOS created for myvol, rather than the default pool.

`SIZE`: The default volume size is 5GB.

`LOCATION`: The host that StorageOS provisioned the volume on.

StorageOS volumes are thin provisioned, so storage is dynamically allocated to
volumes as it is used. You can even provision volumes that are larger than the
storage pool; try resizing the volume to 100GB:

`storageos volume update --size 100 default/myvol`{{execute}}

Inspect the volume to check the size was updated in the JSON config:

`storageos volume inspect default/myvol`{{execute}}
