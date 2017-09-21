export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST_IP]]
curl -sSL https://github.com/storageos/go-cli/releases/download/0.0.13/storageos_linux_amd64 > /usr/local/bin/storageos
chmod +x /usr/local/bin/storageos

CLUSTER_ID=$(storageos cluster create --size 3)

docker -H host01:2345 run -d --name storageos \
    -e HOSTNAME=host01 \
    -e ADVERTISE_IP=[[HOST_IP]] \
    -e CLUSTER_ID=$CLUSTER_ID \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    storageos/node:0.8.1 server

docker -H host02:2345 run -d --name storageos \
    -e HOSTNAME=host02 \
    -e ADVERTISE_IP=[[HOST2_IP]] \
    -e CLUSTER_ID=$CLUSTER_ID \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    storageos/node:0.8.1 server

docker -H host03:2345 run -d --name storageos \
    -e HOSTNAME=host03 \
    -e ADVERTISE_IP=[[HOST3_IP]] \
    -e CLUSTER_ID=$CLUSTER_ID \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    storageos/node:0.8.1 server
