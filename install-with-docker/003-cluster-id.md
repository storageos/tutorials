StorageOS nodes need to know the exact cluster size and peers to connect to during start up. This enables nodes to contact each other over the network. Specify the expected size of the cluster (3 ,5 or 7) using the StorageOS CLI:

`CLUSTER_ID=$(storageos cluster create --size 3)`{{execute}}
