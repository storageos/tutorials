Applications can create a StorageOS volume through the CLI/API/GUI, specifying size and storage features required.

`storageos volume create myvol`{{execute}}

Since you didn't specify any specific size or storage features for your new
volume, StorageOS provisions `myvol` the default settings. To check what these
settings are:

`storageos volume ls`{{execute}}


NAMESPACE/NAME      SIZE                MOUNTED BY          NODE SELECTOR       STATUS REPLICAS            LOCATION
default/myvol       5 GB                                                        active    0/0         host01 (healthy)

You should see that:

`NAMESPACE/NAME`: Namespaces help different projects or teams share a StorageOS cluster. StorageOS has created a `default` namespace and created `default/myvol`. Note that `default` here refer to the default namespace, not the default pool.

`SIZE`: The default volume size is 5GB.

`MOUNTED BY`: This volume is not currently mounted anywhere on the host.

`NODE SELECTOR`: A mechanism for specifying which node(s) the volume can scheduled on.

`STATUS`: The new volume is active and ready to process reads and writes.

`REPLICAS`: The volume is not replicated by default.

`LOCATION`: Which host the data is provisioned on. StorageOS tries to provision the volume on the host that it was created on, to maximise the read/write performance.

StorageOS volumes are thin provisioned, so storage is dynamically allocated to
volumes as it is used. You can even provision volumes that are larger than the storage pool - try resizing the volume now:

`storageos volume update --size 100GB`

Inspect the volume to see the configuration in JSON format:

`storageos volume inspect`{{execute}}
