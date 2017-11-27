To confirm that the nodes can contact each other, install the StorageOS CLI:

`curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/0.9.1/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/`{{execute}}

and set the environment variables so you can connect to the cluster:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute}}

Check on the status of the different components:

`storageos cluster health`{{execute}}

If they are any problems, check the Docker logs:

`journalctl -u docker`{{execute}}
