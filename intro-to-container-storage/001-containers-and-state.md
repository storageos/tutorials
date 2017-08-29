`TOKEN=$(storageos cluster create --size 1 | tr -s ':'| cut -d ':' -f 2 | xargs); echo $TOKEN`{{execute}}

`mkdir -p /var/lib/storageos/data`{{execute}}

`
docker run -d --name storageos \
    -e HOSTNAME=$HOSTNAME \
    -e ADVERTISE_IP=[[HOST_IP]] \
    -e CLUSTER_ID=$TOKEN \
    --net=host \
    --pid=host \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -v /var/lib/storageos:/var/lib/storageos:rshared \
    -v /run/docker/plugins:/run/docker/plugins \
    soegarots/node:uuid-bc403991 server
`{{execute}}

`docker container run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute}}

```
docker run --name postgres01 \
    -e PGDATA=/var/lib/postgresql/data/db \
    -v postgres01:/var/lib/postgresql/data \
    --volume-driver=storageos -d postgres
```{{execute}}
