In this tutorial, you will install StorageOS on a three node Docker cluster.
Open up terminals for the second and third host (type `yes` where prompted):

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

You should also install the StorageOS CLI:

`curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.0.0/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/`{{execute}}

and set the environment variables so you can connect to the cluster:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST_IP]]`{{execute}}
