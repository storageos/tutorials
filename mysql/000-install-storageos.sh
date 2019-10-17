launch.sh
curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.2.2/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/


ssh  -o "StrictHostKeyChecking=no" root@[[HOST1_IP]] "docker run --name enable_lio --privileged  \
--rm --cap-add=SYS_ADMIN -v /lib/modules:/lib/modules  \
-v /sys:/sys:rshared storageos/init:0.2; \
docker -H [[HOST1_IP]]:2345 run -d --name storageos1 -e DISABLE_TELEMETRY=true \
-e HOSTNAME=node02  -e ADVERTISE_IP=[[HOST1_IP]] -e JOIN=[[HOST1_IP]] \
--net=host --pid=host --privileged --cap-add SYS_ADMIN \
--device /dev/fuse -v /sys:/sys -v /var/lib/storageos:/var/lib/storageos:rshared \
-v /run/docker/plugins:/run/docker/plugins storageos/node:1.4.0 server"
