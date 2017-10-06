Prerequisites to run on each host:

`sudo modprobe nbd nbds_max=1024`{{execute}}
`sudo mkdir -p /var/lib/storageos`{{execute}}
`sudo curl -o /etc/docker/plugins/storageos.json --create-dirs https://docs.storageos.com/assets/storageos.json`{{execute}}
