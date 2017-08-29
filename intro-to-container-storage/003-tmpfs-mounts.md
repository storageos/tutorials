## Step 3: tmpfs mounts

There may be cases where you do not want to store a container’s data on the host machine, but you also don’t want to write the data into the container’s writable layer, for performance or security reasons, or if the data relates to non-persistent application state. An example might be a temporary one-time password that the container’s application creates and uses as-needed.

To give the container access to the data without writing it anywhere permanently, you can use a tmpfs mount, which is only stored in the host machine’s memory (or swap, if memory is low). When the container stops, the tmpfs mount is removed. If a container is committed, the tmpfs mount is not saved.

```
docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/data \
  busybox sh
```{{execute}}


### Limitations of tmpfs containers
* tmpfs mounts cannot be shared among containers.
* tmpfs mounts only work on Linux containers, and not on Windows containers.
