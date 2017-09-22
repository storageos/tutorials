To use StorageOS volumes with containers, simply add the --volume-driver flag to the standard Docker run command. Let's run a container withs a shell so we can run commands inside the container.

`docker run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute}}

This mounts myvol to /data inside the container.

`ls /data`{{execute}}

StorageOS automatically formatted the volume with the ext4 filesystem, so you should see lost+found. Now you can try writing data into a file, then exit the shell and the container.

`echo "I'm writing some data to a StorageOS volume" > /data/myfile`{{execute}}

`exit`{{execute}}
