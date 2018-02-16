Now start StorageOS on the last node:

`docker run -d --name storageos -e HOSTNAME=host03 -e ADVERTISE_IP=[[HOST3_IP]] -e JOIN=[[HOST_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.10.0 server `{{execute T3}}

Confirm that the installation was successful:

`docker ps`{{execute T3}}

You should now have three nodes in your cluster:

`storageos node ls`{{execute T3}}
