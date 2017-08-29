Containers are stateless by design. To understand what that means, let's revise what containers and images are.

`docker pull ubuntu:17.04`{{execute}}

When you pull the Ubuntu image from a repository, you can see Docker pulling down individual layers.
`
17.04: Pulling from library/ubuntu
e8a74323e913: Pull complete
5fe91835aea8: Pull complete
4b2aac3e93a5: Extracting    505 B/505 B
faefbf4d7e6d: Download complete
071e113a30b5: Download complete
`

Each layer is represents an instruction in the image’s Dockerfile and all are read-only except the very last one. Each of these layers is stored in its own directory inside the Docker host’s local storage area. To examine the layers on the filesystem using the default storage driver, aufs:

`ls /var/lib/docker/aufs/layers`{{execute}}

When you start a container, a thin writable container layer is added on top of the other layers. Any changes the container makes to the filesystem are stored here.
`docker run -d -it busybox sh`{{execute}}

When an existing file in a container is modified, the storage driver performs a copy-on-write operation.
`docker run -d -it busybox touch myfile`{{execute}}

Copy-on-write saves space and reduces start-up times compared to virtual machines, but when a container is deleted, any data written to the container is also deleted.
