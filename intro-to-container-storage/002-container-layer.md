When you start a container, a thin writable container layer is added on top of the other layers. Any changes the container makes to the filesystem are stored here.
`docker run -d -it busybox sh`{{execute}}

When an existing file in a container is modified, the storage driver performs a copy-on-write operation.
`docker run -d -it busybox touch myfile`{{execute}}

Copy-on-write saves space and reduces start-up times compared to virtual machines, but there are some downsides:

* The data won’t persist when that container is no longer running, and it can be difficult to get the data out of the container if another process needs it.
* A container’s writable layer is tightly coupled to the host machine where the container is running. You can’t easily move the data somewhere else.
* Writing into a container’s writable layer requires a storage driver to manage the filesystem. The storage driver provides a union filesystem, using the Linux kernel. This extra abstraction reduces performance as compared to using data volumes, which write directly to the host filesystem.
