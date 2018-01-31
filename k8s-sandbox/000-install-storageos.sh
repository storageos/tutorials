launch.sh
docker -H [[HOST2_IP]]:2345 run -d --name storageos -e HOSTNAME=node01 -e ADVERTISE_IP=[[HOST2_IP]] -e JOIN=[[HOST2_IP]] --net=host --pid=host --privileged --cap-add SYS_ADMIN --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared -v /run/docker/plugins:/run/docker/plugins storageos/node:0.9.2 server
curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/0.9.2/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/

scp -p ~/.ssh/id_rsa root@node01:/root/.ssh
$(ssh root@node01] "export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]")
