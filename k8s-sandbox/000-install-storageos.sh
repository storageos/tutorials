launch.sh
scp -p ~/.ssh/id_rsa root@node01:/root/.ssh
ssh root@master "echo [[HOST2_IP]] node01 >> /etc/hosts"
docker -H node01:2345 run -d --name storageos -e HOSTNAME=node01 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=[[HOST2_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.2 server
