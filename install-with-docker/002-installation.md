Now you can install the StorageOS node container on each host.

In the first terminal:

`docker run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST_IP]] -e JOIN=[[HOST_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.0 server `{{execute T1}}

In the second terminal:

`docker run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=[[HOST_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.0 server `{{execute T2}}

In the third terminal:

`docker run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST3_IP]] -e JOIN=[[HOST_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.0 server `{{execute T3}}

Confirm that the installation was successful:

`docker ps`{{execute}}
