sudo modprobe nbd nbds_max=1024

docker plugin install --alias storageos storageos/plugin ADVERTISE_IP=[[HOST_IP]] INITIAL_CLUSTER=storageos-1=http://[[HOST_IP]]:2380
