StorageOS uses etcd to store its metadata. We will install etcd on node01 as systemd service. Check
https://docs.storageos.com/docs/prerequisites/etcd/ if you want a
production topology. The following method is based on the manual installation in the docs that's been automated with a script.

First, you need to add the ip of the ETCD host in the script file with this command.

`echo export ETCD_HOST=${ETCD_HOST} | cat - install-etcd.sh > temp && mv temp install-etcd.sh`{{execute}}

Then, you need to send the script to node01 to be able to execute it there.

`scp install-etcd.sh node01:~/install-etcd.sh`{{execute}}

Then, you need to ssh into the node to execute the installation script.

`ssh node01`{{execute}}

Lastly, you execute the etcd installation script with the following command.

`bash install-etcd.sh`{{execute}}

The script will create all the necessary directories and configuration to run etcd on 1 node. This is only for testing purposes in this demo. It is recommended to have 3 etcd nodes for production and to provision them with a provisioning tool like Ansible. Check https://docs.storageos.com/docs/prerequisites/etcd/ for more information on how to do that.

Now you need to go back to master to continue the demo. You can do that by pressing `CTRL + d` or typing `exit`{{execute}}. Once your terminal shows the current machine as master, you can continue to the next step of the demo.