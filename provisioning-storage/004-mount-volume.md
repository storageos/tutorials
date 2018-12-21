To use StorageOS volumes with containers, you use the standard Docker run
command with some additional flags. Let's run a container with a shell so we
can run commands inside the container:

`docker run -it --volume-driver storageos --volume myvol:/data busybox
sh`{{execute}}

`--volume-driver storageos` tells Docker that StorageOS is managing these
volumes.

`--volume myvol:/data` instructs Docker to mount myvol to `/data` inside the
container.

If you run `ls /data`{{execute}} you should see `lost+found`, because StorageOS
volumes are automatically formatted with a filesystem on creation. Try writing
data into a file:

`echo "I'm writing some data to a StorageOS volume" > /data/myfile`{{execute}}

Exit the shell and the container:

`exit`{{execute}}
