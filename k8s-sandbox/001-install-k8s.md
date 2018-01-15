Verify that you have a master and a worker node (`node01`) running:

`kubectl get nodes`{{execute}}

Create daemonset:

`kubectl apply -f storageos-daemonset.yaml`{{execute}}

You should also install the StorageOS CLI:

`curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/0.9.3/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/`{{execute}}

and set the environment variables so you can connect to the cluster:

`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST_IP]]`{{execute}}

Check that a one-node StorageOS cluster has started successfully:

`storageos node ls`{{execute}}
