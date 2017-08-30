You can verify that the volume was created and mounted correctly by inspecting the container:

`docker inspect voltest`{{execute}}

You should see the Mounts section:
```
"Mounts": [
    {
        "Type": "volume",
        "Name": "myvol",
        "Source": "/var/lib/docker/volumes/myvol/_data",
        "Destination": "/data",
        "Driver": "local",
        "Mode": "",
        "RW": false,
        "Propagation": ""
    }
],```

You can mount any number of data volumes into a container.

`docker run \
  -it \
  --mount source=vol1,target=/data/vol1 \
  --mount source=vol2,target=/data/vol2 \
  busybox ls /data
`{{execute}}

Multiple containers can also share one or more data volumes.

`docker run \
  -it \
  --name voltest \
  --mount source=myvol,target=/data \
  busybox ls /data
`{{execute}}

This will mount the existing volume called myvol, so you should see `testfile` outputted.
