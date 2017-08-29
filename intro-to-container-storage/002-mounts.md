It is possible to store data within the writable layer of a container, but there are some downsides:

* The data won’t persist when that container is no longer running, and it can be difficult to get the data out of the container if another process needs it.
* A container’s writable layer is tightly coupled to the host machine where the container is running. You can’t easily move the data somewhere else.
* Writing into a container’s writable layer requires a storage driver to manage the filesystem. The storage driver provides a union filesystem, using the Linux kernel. This extra abstraction reduces performance as compared to using data volumes, which write directly to the host filesystem.

## Working with mounts

Docker offers three different ways to mount data into a container from the Docker host: volumes, bind mounts, or tmpfs volumes



`--mount`: Consists of multiple key-value pairs, separated by commas and each consisting of a <key>=<value> tuple. The --mount syntax is more verbose than -v or --volume, but the order of the keys is not significant, and the value of the flag is easier to understand.
The `type` of the mount, which can be bind, volume, or tmpfs.
The `source` of the mount. For named volumes, this is the name of the volume. For anonymous volumes, this field is omitted. May be specified as `source` or `src`.
The `destination` takes as its value the path where the file or directory will be mounted in the container. May be specified as `destination`, `dst`, or `target`.
The `readonly` option, if present, causes the bind mount to be mounted into the container as read-only.
The `volume-opt` option, which can be specified more than once, takes a key-value pair consisting of the option name and its value.
