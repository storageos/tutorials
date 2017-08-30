`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos`{{execute}}

`TOKEN=$(storageos cluster create --size 3 | tr -s ':'| cut -d ':' -f 2 | xargs); echo $TOKEN`{{execute}}

`
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
    soegarots/node:uuid-bc403991 server
`{{execute}}

`
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
    soegarots/node:uuid-bc403991 server
`{{execute}}

`
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
    soegarots/node:uuid-bc403991 server
`{{execute}}

`storageos node ls`{{execute}}

`storageos pool ls`{{execute}}

`storageos node inspect storage-03`{{execute}}


`docker container run -it -w /data/ --volume-driver storageos --volume myvol:/data busybox sh`{{execute}}

`storageos volume ls`{{execute}}

`docker -H host02:2345 container run -it -w /data/ --volume-driver storageos --volume myvol:/data busybox sh`{{execute}}

## Replicated Volumes

http://docs.storageos.com/docs/manage/features/

`docker volume create --driver storageos --opt size=15 --opt storageos.feature.replicas=2 myvol-replicated`{{execute}}

`docker container run -it -w /data/ --volume-driver storageos --volume myvol-replicated:/data busybox sh`{{execute}}

`storageos volume ls`{{execute}}

`docker -H host01:2345 kill storageos`{{execute}}

`storageos -H host02 volume ls`{{execute}}

`docker -H host02:2345 container run -it -w /data/ --volume-driver storageos --volume myvol-replicated:/data busybox sh`{{execute}}

`docker -H host03:2345 container run -it -w /data/ --volume-driver storageos --volume myvol-replicated:/data busybox sh`{{execute}}

## Use Case: Postgres

`docker volume create --driver storageos --opt size=15 --opt storageos.feature.replicas=2 postgres01`{{execute}}

```
docker run --name postgres01 \
    -e PGDATA=/var/lib/postgresql/data/db \
    -v postgres01:/var/lib/postgresql/data \
    --volume-driver=storageos -d postgres
```{{execute}}

## SSH into individual nodes

`ssh root@host02`{{execute T2}}

`ssh root@host03`{{execute T3}}
