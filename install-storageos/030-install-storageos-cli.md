StorageOS has a CLI and GUI. We are using the CLI to verify the installation.


Install StorageOS CLI

```curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/v2.0.0/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/```{{execute}}

Configure the credentials for the CLI to be able to authenticate to the cluster

The credentials are defined in the Secret from the previous steps.
```
export STORAGEOS_USERNAME=storageos 
export STORAGEOS_PASSWORD=storageos
export STORAGEOS_ENDPOINTS=http://[[HOST2_IP]]:5705
```{{execute}}

Check the nodes

`storageos get nodes`{{execute}}

`storageos describe nodes`{{execute}}

`storageos get nodes -oyaml`{{execute}}

