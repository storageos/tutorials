With a Docker installation you can create a volume using the StorageOS CLI or
Web interface.

To create a volume using the CLI

`storageos volume create myvol`{{execute T1}}

Display the volume that you just created

`storageos volume ls`{{execute T1}}

To access the CLI you can connect to port 5705 on any StorageOS host. Here you
can access the GUI using the following URL, and login as User:storageos with
the password: storageos

https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/

Mount the volume in a container

`docker run                 \
  --interactive             \
  --tty                     \
  --volume-driver=storageos \
  --volume=myvol:/data      \
  busybox sh
`{{execute T1}}


Write data to the volume

`
echo "Hello" >> /data/hello.txt
`{{execute T1}}


Check that data has been written

`
cat /data/hello.txt
`{{execute T1}}

