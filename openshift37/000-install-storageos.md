## Prepare host

First, install the required kernel modules will be enabled by running the following.

``./enable-lio.sh``{{execute}}

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

First, create a secret that specifies the StorageOS api endpoint.

`APIADDRESS=$(echo -n "tcp://127.0.0.1:5705" | base64); sed -i "s/REPLACE/$APIADDRESS/g" secret.yaml`{{execute}}

`oc --as system:admin -n default create -f secret.yaml`{{execute}}

Create `fast` StorageClass:

`oc --as system:admin create -f storageclass.yaml`{{execute}}


