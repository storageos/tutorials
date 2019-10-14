CLUSTER_ID=$(ssh root@host01 "storageos cluster create")

docker -H host01:2345 run -d --name storageos -e DISABLE_TELEMETRY=true -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:1.4.0 server

docker -H host02:2345 run -d --name storageos -e DISABLE_TELEMETRY=true -e HOSTNAME=host02 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:1.4.0 server

docker -H host03:2345 run -d --name storageos -e DISABLE_TELEMETRY=true -e HOSTNAME=host03 -e ADVERTISE_IP=[[HOST3_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:1.4.0 server

scp -p ~/.ssh/id_rsa root@host01:/root/.ssh
ssh root@host01 "echo [[HOST2_IP]] host02 >> /etc/hosts && echo [[HOST3_IP]] host03 >> /etc/hosts"