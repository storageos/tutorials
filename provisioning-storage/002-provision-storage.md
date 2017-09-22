Applications can create a StorageOS volume through the CLI, API or GUI. Create yourself a volume:

`storageos volume create myvol`{{execute}}

Since you didn't specify any specific size or storage features for your new
volume, StorageOS uses the default settings. To find out what these
settings are:

`storageos volume ls  --format "table {{.Name}} {{.Size}} {{.Location}}"`{{execute}}

`NAMESPACE/NAME`: Namespaces help different projects or teams share a StorageOS cluster. StorageOS has created a default namespace for myvol. Note that default here refer to the default namespace, not the default pool.

`SIZE`: The default volume size is 5GB.

`LOCATION`: Which host the volume is provisioned on.

StorageOS volumes are thin provisioned, so storage is dynamically allocated to
volumes as it is used. You can even provision volumes that are larger than the
storage pool - go ahead and resize the volume to 100GB:

`storageos volume update --size 100 default/myvol`{{execute}}

Inspect the volume to check the size was updated in the JSON config:

`storageos volume inspect default/myvol`{{execute}}
