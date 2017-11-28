Create daemonset:

`kubectl apply -f storageos-daemonset.yaml`{{execute}}

Verify service has started:

`kubectl get svc kubernetes`{{execute}}

Download StorageOS:

`curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/0.9.1/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/`{{execute}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST2_IP]]`{{execute}}

Create API secret:

`echo -n "tcp:/[[HOST2_IP]]:5705" | base64`{{execute}}

Replace `apiAddress` field in storageos-secret.yaml with the encoded value.

`kubectl create -f storageos-secret.yaml`{{execute}}

Create StorageClass:

`kubectl create -f storageos-storageclass.yaml`{{execute}}

Create PersistentVolumeClaim:

`kubectl create -f storageos-pvc.yaml`{{execute}}

Create Redis pod:

`kubectl create -f storageos-pod.yaml`{{execute}}


Everything:

`kubectl apply -f storageos-pvc.yaml -f storageos-service.yaml -f storageos-pod.yaml -f storageos-secret.yaml -f storageos-storageclass.yaml`{{execute}}
