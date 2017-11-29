Check that the data was persisted by mounting the volume on the host and reading the file:

`storageos volume mount default/myvol /mnt`{{execute}}

`ls /mnt`{{execute}}

`cat /mnt/myfile`{{execute}}

You should see the string you just wrote: `I'm writing some data to a StorageOS volume`.

Now unmount the volume again:

`storageos volume unmount default/myvol`{{execute}}
