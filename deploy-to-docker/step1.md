`TOKEN=$(storageos cluster create --size 3 | tr -s ':'| cut -d ':' -f 2 | xargs); echo $TOKEN`{{execute}}

`
docker -H host01:2345 run -d --name storageos \
    -e HOSTNAME=[[HOST1_SUBDOMAIN]] \
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

`
docker -H host02:2345 run -d --name storageos \
    -e HOSTNAME=[[HOST2_SUBDOMAIN]] \
    -e ADVERTISE_IP=[[HOST2_IP]] \
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

`
docker -H host03:2345 run -d --name storageos \
    -e HOSTNAME=[[HOST3_SUBDOMAIN]] \
    -e ADVERTISE_IP=[[HOST3_IP]] \
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

`storageos node ls`{{execute}}

`ssh root@host02`{{execute T2}}

`ssh root@host03`{{execute T3}}

`docker container run -it --volume-driver storageos --volume myvol:/data busybox sh`{{execute}}

```
docker run --name postgres01 \
    -e PGDATA=/var/lib/postgresql/data/db \
    -v postgres01:/var/lib/postgresql/data \
    --volume-driver=storageos -d postgres
```{{execute}}
