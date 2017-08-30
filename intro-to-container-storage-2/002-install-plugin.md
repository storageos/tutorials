We'll use the StorageOS plugin to demonstrate.

`docker plugin install \
--alias storageos \
storageos/plugin \
ADVERTISE_IP=[[HOST_IP]] INITIAL_CLUSTER=storageos-1=http://[[HOST_IP]]:2380`{{execute}}

Once it's finished downloading, try `docker plugin ls`{{execute}} and `docker plugin inspect storageos`{{execute}}.
