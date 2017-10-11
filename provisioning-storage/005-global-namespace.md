StorageOS volumes are globally namespaced, meaning that any host can access the volumes.

Mount myvol to a different host:

`docker run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute T2}}

Check the container can see myfile:
`cat /data/myfile`{{execute T2}}
