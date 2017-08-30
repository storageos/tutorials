An alternative way to share volumes between containers is to use data containers.

These are essentially dormant containers that have one or more volumes created within it.

When you start up additional containers, these volmes can be exported to one or more other containers using `-volumes-from`:

`docker run -it --volumes-from 777f7dc92da7 --volumes-from ba8c0c54f0f2:ro busybox sh`{{execute}}
