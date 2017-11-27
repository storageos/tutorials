Now you can install the StorageOS plugin on each host.

In the first terminal:

`docker plugin install --alias storageos --grant-all-permissions storageos/plugin:0.9.0 ADVERTISE_IP=[[HOST_IP]] JOIN=[[HOST_IP]],[[HOST2_IP]],[[HOST3_IP]]`{{execute T1}}

In the second terminal:

`docker plugin install --alias storageos --grant-all-permissions storageos/plugin:0.9.0 ADVERTISE_IP=[[HOST2_IP]] JOIN=[[HOST_IP]],[[HOST2_IP]],[[HOST3_IP]]`{{execute T2}}

In the third terminal:

`docker plugin install --alias storageos --grant-all-permissions storageos/plugin:0.9.0 ADVERTISE_IP=[[HOST3_IP]] JOIN=[[HOST_IP]],[[HOST2_IP]],[[HOST3_IP]]`{{execute T3}}

Confirm that the installation was successful:

`docker plugin ls`{{execute}}
