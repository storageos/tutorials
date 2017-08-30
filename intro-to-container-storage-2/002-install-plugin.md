To install the StorageOS plugin, you will first need a CLUSTER_ID token to allow hosts to discover each other:

`docker run storageos/cli cluster create`{{execute}}

Install on each host in turn, adding the token outputted above:

`docker plugin install \
--alias storageos \
storageos/plugin \
ADVERTISE_IP=[[HOST_IP]] CLUSTER_ID=$CLUSTER_ID`{{execute HOST1}}

`docker plugin install \
--alias storageos \
storageos/plugin \
ADVERTISE_IP=[[HOST2_IP]] CLUSTER_ID=$CLUSTER_ID`{{execute HOST2}}

`docker plugin install \
--alias storageos \
storageos/plugin \
ADVERTISE_IP=[[HOST3_IP]] CLUSTER_ID=$CLUSTER_ID`{{execute HOST3}}

Once it's finished downloading, check out your freshly installed plugin with `docker plugin ls`{{execute}} and `docker plugin inspect storageos`{{execute}}.
