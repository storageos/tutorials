## Step 6: Volume drivers

Volume drivers allow you to store volumes on remote hosts or cloud providers, to encrypt the contents of volumes, or to add other functionality.

`docker container run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute}}
