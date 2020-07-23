`echo export ETCD_HOST=${ETCD_HOST} | cat - install-etcd.sh > temp && mv temp install-etcd.sh`{{execute}}

`scp install-etcd.sh node01:~/install-etcd.sh`{{execute}}

`ssh node01`{{execute}}

`bash install-etcd.sh`{{execute}}