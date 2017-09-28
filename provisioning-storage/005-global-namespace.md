Start a shell on a different host, with myvol mounted:

`docker run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute T2}}

Check the container can see myfile:
`cat /data/myfile`{{execute T2}}
