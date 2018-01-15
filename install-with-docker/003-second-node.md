Now switch to the second node and install the container again:

`docker run -d --name storageos -e HOSTNAME=host02 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=[[HOST_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.2 server `{{execute T2}}

Confirm that the installation was successful:

`docker ps`{{execute T2}}

and that you have a two node cluster:

`storageos node ls`{{execute T2}}
