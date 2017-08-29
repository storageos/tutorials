## Step 4: Bind mounts

When you use a bind mount, a file or directory on the host machine is mounted into a container. The file or directory is referenced by its full or relative path on the host machine.

The file or directory does not need to exist on the Docker host already. It is created on demand if it does not yet exist. Bind mounts are very performant, but they rely on the host machine’s filesystem having a specific directory structure available.

`mkdir target`{{execute}}

`touch target/helloworld`{{execute}}

```
docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/data \
  busybox sh
```{{execute}}

### Limitations

* Rely on the host machine’s filesystem having a specific directory structure available
* You can’t use Docker CLI commands to directly manage bind mounts.
