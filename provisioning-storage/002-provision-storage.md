Applications can create a StorageOS volume through the CLI, API or GUI.

Create the volume using the CLI:

`storageos volume create myvol`{{execute}}

Since you didn't specify any specific size or storage features for your new
volume, StorageOS provisions it the default settings. To find out what these
settings are:

`storageos volume ls`{{execute}}

You should see that:

`NAMESPACE/NAME`: Namespaces help different projects or teams share a StorageOS cluster. StorageOS has created a default namespace and created `default/myvol`. Note that default here refer to the default namespace, not the default pool.

`SIZE`: The default volume size is 5GB.

`MOUNTED BY`: This volume is not currently mounted on any nodes.

`NODE SELECTOR`: A mechanism for specifying which node(s) the volume can scheduled on.

`STATUS`: The new volume is active and ready to process reads and writes.

`REPLICAS`: The volume is not replicated by default.

`LOCATION`: Which host the data is provisioned on. StorageOS tries to provision the volume on the host that it was created on, to maximise the read/write performance.

StorageOS volumes are thin provisioned, so storage is dynamically allocated to
volumes as it is used. You can even provision volumes that are larger than the
storage pool - resize the volume now:

`storageos volume update --size 100 default/myvol`{{execute}}

Inspect the volume to see it really was updated to 100GB:

`storageos volume inspect default/myvol`{{execute}}
