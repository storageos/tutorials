An alternative way to share volumes between containers is to use data containers.

These are essentially dormant containers that have one or more volumes created within it.

When you start up additional containers, these volmes can be exported to one or more other containers using `-volumes-from`:

`docker ps`{{execute}}

`docker run -it --volumes-from <container id>:ro busybox sh`

:ro specifies read-only.
