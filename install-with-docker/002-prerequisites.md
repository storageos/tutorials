You will need to run each prerequisites on each host, in any order:

1. Enable Network Block Device kernel module:

`sudo modprobe nbd nbds_max=1024`{{execute}}

2. Create directory so StorageOS can share volumes:

`sudo mkdir -p /var/lib/storageos`{{execute}}

3. Configure Docker to use the StorageOS volume plugin:

`sudo curl -o /etc/docker/plugins/storageos.json --create-dirs https://docs.storageos.com/assets/storageos.json`{{execute}}

4. Install StorageOS CLI:

`curl -sSL https://github.com/storageos/go-cli/releases/download/0.0.13/storageos_linux_amd64 > /usr/local/bin/storageos`{{execute}}
`chmod +x /usr/local/bin/storageos`{{execute}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`
