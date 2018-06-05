## Prepare host

Required kernel modules will be enabled by running the following `./enable-lio.sh`

``chmod +x enable-lio.sh && ./enable-lio.sh``{{execute}}

## Install StorageOS

(Until openshift version 3.9, feature gates such as mount propagation are not supported. Because of that, the installation of StorageOS is done by container installation rather than DaemonSet)

``
docker run -d --name storageos \
           -e HOSTNAME \
           -e ADVERTISE_IP=[[HOST_IP]] \
           -e JOIN=[[HOST_IP]] \
           --pid=host \
           --network=host \
           --privileged \
           --cap-add SYS_ADMIN \
           --device /dev/fuse \
           -v /sys:/sys \
           -v /var/lib/storageos:/var/lib/storageos:rshared \
           -v /run/docker/plugins:/run/docker/plugins \
           storageos/node:1.0.0-rc2 server
``{{execute}}


## Create StorageClass

First, it is required to create a secret that sets the api endpoint of StorageOS

`APIADDRESS=$(echo -n "tcp://127.0.0.1:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" secret.yaml`{{execute}}

`oc --as system:admin -n default create -f secret.yaml`{{execute}}

Create `fast` StorageClass:

`oc --as system:admin create -f storageclass.yaml`{{execute}}


