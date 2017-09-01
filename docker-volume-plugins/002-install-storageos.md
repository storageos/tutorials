To install the StorageOS volume plugin for testing, run the following command:

```bash
docker plugin install --alias storageos storageos/plugin \
ADVERTISE_IP=[[HOST_IP]] INITIAL_CLUSTER=[[KATACODA_HOST]]=http://[[HOST_IP]]:5707
```{{execute}}

Check out installed successfully using `docker plugin ls`{{execute}} and `docker plugin inspect storageos`{{execute}}.
