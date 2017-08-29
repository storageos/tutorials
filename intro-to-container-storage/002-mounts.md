## Step 2: The --mount command

`--mount`: Consists of multiple key-value pairs, separated by commas and each consisting of a <key>=<value> tuple. The --mount syntax is more verbose than -v or --volume, but the order of the keys is not significant, and the value of the flag is easier to understand.
The `type` of the mount, which can be bind, volume, or tmpfs.
The `source` of the mount. For named volumes, this is the name of the volume. For anonymous volumes, this field is omitted. May be specified as `source` or `src`.
The `destination` takes as its value the path where the file or directory will be mounted in the container. May be specified as `destination`, `dst`, or `target`.
The `readonly` option, if present, causes the bind mount to be mounted into the container as read-only.
The `volume-opt` option, which can be specified more than once, takes a key-value pair consisting of the option name and its value.

```
docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/data \
  busybox sh
```{{execute}}
