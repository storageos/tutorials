## Step 6: Data container

The --volumes-from flag mounts all the defined volumes from the referenced containers. Containers can be specified by repetitions of the --volumes-from argument. The container ID may be optionally suffixed with :ro or :rw to mount the volumes in read-only or read-write mode, respectively. By default, the volumes are mounted in the same mode (read write or read only) as the reference container.

### Start a container with a volume
`
docker run -d \
  -it \
  --name devtest \
  --mount source=myvol2,target=/data \
  busybox sh
`{{execute}}

`docker run --volumes-from 777f7dc92da7 --volumes-from ba8c0c54f0f2:ro -i -t busybox sh`{{execute}}
