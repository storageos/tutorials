Now you can install the StorageOS node container on each host.

In the first terminal:

`docker run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST_IP]] -e JOIN=[[HOST_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.10.0 server `{{execute T1}}

Wait until the container reports that it is healthy:

`docker ps`{{execute T1}}

and confirm that StorageOS has started on the first node:

`storageos node ls`{{execute T1}}
