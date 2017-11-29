Now you can install the StorageOS node container on each host.

Create a cluster token to allow the nodes to find each other:

`CLUSTER_ID=$(storageos cluster create --size 3)`{{execute T1}}

Install on three nodes in turn:

`docker -H host01:2345 run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.0 server `{{execute T1}}

`docker -H host02:2345 run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.0 server `{{execute T1}}

`docker -H host03:2345 run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST3_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.0 server `{{execute T1}}

Confirm that the installation was successful:

`docker ps`{{execute}}

<div>This is in a div</div>
<span>This is in a div</span>
