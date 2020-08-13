StorageOS uses etcd to store its metadata. We will install etcd on node01.
Please check https://docs.storageos.com/docs/prerequisites/etcd/ for a
production topology.

1. Add the ip of the Etcd host in the script

    `echo export ETCD_HOST=${ETCD_HOST} | cat - install-etcd.sh > temp && mv temp install-etcd.sh`{{execute}}

1. Send the script to node01

    `scp -o StrictHostKeyChecking=no install-etcd.sh node01:~/install-etcd.sh`{{execute}}

1. Execute the installation script in the node.

    `ssh node01 bash install-etcd.sh`{{execute}}

1. Verify that Etcd is running

    `ssh node01 ETCDCTL_API=3 etcdctl --endpoints=http://127.0.0.1:2379 member list`{{execute}}

    The output should be something like this:

    `77956fff650359b8, started, etcd-172.17.0.18, http://172.17.0.18:2380, http://172.17.0.18:2379, false`
