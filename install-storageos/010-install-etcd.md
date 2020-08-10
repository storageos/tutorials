StorageOS uses etcd to store its metadata. We will install etcd on node01 as a systemd service. Please check
https://docs.storageos.com/docs/prerequisites/etcd/ for a
production topology. The following method is based on the scripted installation in the docs.

First, you need to add the ip of the ETCD host in the script file with this command.

`echo export ETCD_HOST=${ETCD_HOST} | cat - install-etcd.sh > temp && mv temp install-etcd.sh`{{execute}}

Then, you need to send the script to node01 to be able to execute it there.

`scp -o StrictHostKeyChecking=no install-etcd.sh node01:~/install-etcd.sh`{{execute}}

Afterwards, you need to execute the installation script in the node.

`ssh node01 bash install-etcd.sh`{{execute}}

The script will create all the necessary directories and configuration to run
etcd on one node. It is recommended to have 3 etcd nodes for production and to
provision them with a provisioning tool like Ansible. Check
https://docs.storageos.com/docs/prerequisites/etcd/ for more information on how
to do that. However for the purposes of this demo a one node cluster will suffice.

To make sure that etcd is running, you need to run a health check:

`ssh node01 ETCDCTL_API=3 etcdctl --endpoints=http://127.0.0.1:2379 member list`{{execute}}

The output should be something like this:

`77956fff650359b8, started, etcd-172.17.0.18, http://172.17.0.18:2380, http://172.17.0.18:2379, false`
