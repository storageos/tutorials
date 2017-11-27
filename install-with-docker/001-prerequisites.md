In this tutorial, you will install StorageOS on a three node Docker cluster.

Open terminals for the second and third hosts (type `yes` where prompted):
`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

Note that Docker is already installed.

NBD (Network Block Device) is a default Linux kernel module that allows block devices to be run in userspace. It is not a requirement for StorageOS to run, but improves performance significantly.

Switch to each terminal in turn and enable the module:
`sudo modprobe nbd nbds_max=1024`{{execute}}
