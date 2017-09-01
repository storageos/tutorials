export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST_IP]]

TOKEN=$(storageos cluster create --size 3)

docker -H host01:2345 run -d --name storageos \
    -e HOSTNAME=storage-01 \
    -e ADVERTISE_IP=[[HOST_IP]] \
    -e CLUSTER_ID=$TOKEN \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    storageos/node server}}

docker -H host02:2345 run -d --name storageos \
    -e HOSTNAME=storage-02 \
    -e ADVERTISE_IP=[[HOST2_IP]] \
    -e CLUSTER_ID=$TOKEN \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    storageos/node server

docker -H host03:2345 run -d --name storageos \
    -e HOSTNAME=storage-03 \
    -e ADVERTISE_IP=[[HOST3_IP]] \
    -e CLUSTER_ID=$TOKEN \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    storageos/node server
