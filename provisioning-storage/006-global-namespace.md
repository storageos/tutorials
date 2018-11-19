StorageOS volumes are globally namespaced, meaning that any host can access the volumes.

Switch to the second host and mount `myvol` again:

`docker run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute T2}}

Check the container can see myfile

`cat /data/myfile`{{execute T2}}

You can confirm that the volume is located on one host while being mounted by
another host the following command:

`storageos volume ls --format "table {{.Name}}\t{{.MountedBy}}\t{{.Location}}"`
