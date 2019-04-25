Linux-IO is an open source implementation of the SCSI target. It and other
kernel modules are required for StorageOS to function. For more information
please see our
[documentation](https://docs.storageos.com/docs/prerequisites/systemconfiguration).
StorageOS provides a docker container that will ensure the appropriate modules
are loaded.

`docker run --name enable_lio \
           --privileged \
           --rm \
           --cap-add=SYS_ADMIN \
           --volume /lib/modules:/lib/modules \
           --volume /sys:/sys:rshared \
           storageos/init:0.1`{{execute T1}}

Now you can install the StorageOS node container on the host.

In the first terminal:

`docker run -d \
  --name=storageos \
  --env=HOSTNAME=host01 \
  --env=ADVERTISE_IP=[[HOST_IP]] \
  --env=JOIN=[[HOST_IP]] \
  --env=DISABLE_TELEMETRY=true \
  --net=host \
  --pid=host \
  --privileged \
  --cap-add=SYS_ADMIN \
  --device=/dev/fuse \
  --volume=/var/lib/storageos:/var/lib/storageos:rshared \
  --volume=/run/docker/plugins:/run/docker/plugins \
  --volume=/sys:/sys \
  storageos/node:1.2.0 server`{{execute T1}}`

Wait until the container reports that it is healthy:

`until docker ps | grep -q "(healthy)"; do echo "Waiting for container health"; sleep 5; done`{{execute T1}}

and confirm that StorageOS has started on the first node:

`storageos node ls`{{execute T1}}
