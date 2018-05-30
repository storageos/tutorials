CLUSTER_ID=$(ssh root@host01 "storageos cluster create")

docker -H host01:2345 run --name enable_lio --privileged --rm --cap-add=SYS_ADMIN -v /lib/modules:/lib/modules -v /sys:/sys:rshared storageos/init:0.1
docker -H host02:2345 run --name enable_lio --privileged --rm --cap-add=SYS_ADMIN -v /lib/modules:/lib/modules -v /sys:/sys:rshared storageos/init:0.1
docker -H host03:2345 run --name enable_lio --privileged --rm --cap-add=SYS_ADMIN -v /lib/modules:/lib/modules -v /sys:/sys:rshared storageos/init:0.1

docker -H host01:2345 run -d --name storageos -e HOSTNAME=host01 -e ADVERTISE_IP=[[HOST_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /sys:/sys -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:1.0.0-rc1 server

docker -H host02:2345 run -d --name storageos -e HOSTNAME=host02 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /sys:/sys -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:1.0.0-rc1 server

docker -H host03:2345 run -d --name storageos -e HOSTNAME=host03 -e ADVERTISE_IP=[[HOST3_IP]] -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /sys:/sys -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:1.0.0-rc1 server

scp -p ~/.ssh/id_rsa root@host01:/root/.ssh
ssh root@host01 "echo [[HOST2_IP]] host02 >> /etc/hosts && echo [[HOST3_IP]] host03 >> /etc/hosts"
ssh root@host01 "curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.0.0-rc1/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/"
ssh root@host02 "curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.0.0-rc1/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/"
ssh root@host03 "curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.0.0-rc1/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/"
