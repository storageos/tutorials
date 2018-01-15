In this tutorial, you will install StorageOS on a three node Docker cluster.
Open up terminals for the second and third host (type `yes` where prompted):

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

NBD (Network Block Device) is a default Linux kernel module that allows block
devices to be run in userspace. It is not a requirement for StorageOS to run,
but improves performance significantly.

Enable the module on each host in turn:
`sudo modprobe nbd nbds_max=1024`{{execute T1}}
`sudo modprobe nbd nbds_max=1024`{{execute T2}}
`sudo modprobe nbd nbds_max=1024`{{execute T3}}

You should also install the StorageOS CLI:

`curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/0.9.4/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/`{{execute}}

and set the environment variables so you can connect to the cluster:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST_IP]]`{{execute}}
