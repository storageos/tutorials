CLUSTER_ID=$(ssh root@host01 "storageos cluster create --size 3")

docker -H host01:2345 plugin install --grant-all-permissions --alias storageos storageos/plugin:0.9.0 ADVERTISE_IP=[[HOST_IP]] JOIN=$CLUSTER_ID
docker -H host02:2345 plugin install --grant-all-permissions --alias storageos storageos/plugin:0.9.0 ADVERTISE_IP=[[HOST2_IP]] JOIN=$CLUSTER_ID
docker -H host03:2345 plugin install --grant-all-permissions--alias storageos storageos/plugin:0.9.0 ADVERTISE_IP=[[HOST3_IP]] JOIN=$CLUSTER_ID

scp -p ~/.ssh/id_rsa root@host01:/root/.ssh
ssh root@host01 "echo [[HOST2_IP]] host02 >> /etc/hosts && echo [[HOST3_IP]] host03 >> /etc/hosts"
