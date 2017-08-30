Containers are stateless by design. To understand what that means, let's revise how images are built.

`docker pull ubuntu:17.04`{{execute}}

When you pull the Ubuntu image from a repository, you can see that the image is made of multiple layers stacked together.
`
17.04: Pulling from library/ubuntu
e8a74323e913: Pull complete
5fe91835aea8: Pull complete
4b2aac3e93a5: Extracting    505 B/505 B
faefbf4d7e6d: Download complete
071e113a30b5: Download complete
`

Each layer is represents an instruction in the image’s Dockerfile and all are read-only except the very last one. Each of these layers is stored in its own directory under `/var/lib/docker` on the host. To examine the layers on the filesystem:

`ls /var/lib/docker/aufs/layers`{{execute}}

Since all layers are read-only, multiple containers can share access to the same underlying image, making images smaller.
