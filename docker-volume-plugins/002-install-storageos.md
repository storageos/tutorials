Install the StorageOS volume plugin for testing (you will need to accept the permissions):

`
docker plugin install \
--alias storageos storageos/plugin \
ADVERTISE_IP=[[HOST_IP]] INITIAL_CLUSTER=[[KATACODA_HOST]]=http://[[HOST_IP]]:5707
`{{execute}}

Check StorageOS installed successfully using `docker plugin ls`{{execute}}.
