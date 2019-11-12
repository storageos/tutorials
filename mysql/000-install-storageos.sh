launch.sh
curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.2.2/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/

kubectl create -f https://github.com/storageos/cluster-operator/releases/download/1.4.0/storageos-operator.yaml
kubectl create -f storageos-secret.yaml
kubectl create -f storageos-cluster.yaml