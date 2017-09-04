The `--mount` flag mounts a volume into a container.  It consists of comma-separated key-value pairs and takes the following options:

* `type`: Valid options are bind, volume, or tmpfs.
* `source`, `src`: For named volumes, this is the name of the volume. For anonymous volumes, this field is omitted.
* `destination`, `dst`, `target`: The path where the file or directory will be mounted in the container.

`docker run \
  -it \
  --name voltest \
  --mount source=myvol,target=/data \
  busybox touch /data/testfile
`{{execute}}

Note that if you start a container with a volume that does not yet exist, Docker creates the volume for you.

When a container is deleted, any data stored in data volumes persists on the Docker host. Verify the testfile is persisted:

`ls /var/lib/docker/volumes/myvol/_data`{{execute}}
