An alternative way to share volumes between containers is to use data containers.

These essentially a dormant container that has one or more volumes created within it, which can then be exported to one or more other containers using the `-volumes-from` switch when starting up additional containers.

`docker run -it --volumes-from 777f7dc92da7 --volumes-from ba8c0c54f0f2:ro busybox sh`{{execute}}
