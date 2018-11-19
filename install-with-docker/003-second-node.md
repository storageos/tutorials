Now switch to the second node and install the init container again:

`docker run --name enable_lio                \
           --privileged                      \
           --rm                              \
           --cap-add=SYS_ADMIN               \
           -v /lib/modules:/lib/modules      \
           -v /sys:/sys:rshared              \
           storageos/init:0.1`{{execute T2}}

Now you can install the StorageOS node container on the host.

In the second host terminal:

`docker run -d                                           \
  --name=storageos                                       \
  --env=HOSTNAME=host02                                  \
  --env=ADVERTISE_IP=[[HOST2_IP]]                         \
  --env=JOIN=[[HOST_IP]]                                 \
  --net=host                                             \
  --pid=host                                             \
  --privileged                                           \
  --cap-add=SYS_ADMIN                                    \
  --device=/dev/fuse                                     \
  --volume=/var/lib/storageos:/var/lib/storageos:rshared \
  --volume=/run/docker/plugins:/run/docker/plugins       \
  --volume=/sys:/sys                                     \
  storageos/node:1.0.0 server`{{execute T2}}`

Wait until the container reports that it is healthy:

`docker ps`{{execute T2}}

and that you have a two node cluster:

`storageos node ls`{{execute T2}}
