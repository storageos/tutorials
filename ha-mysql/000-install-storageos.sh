launch.sh
export ETCD_HOST=[[HOST1_IP]]

echo "Installing StorageOS and ETCD"

sleep 5

# Deploy StorageOS cli
curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/v2.1.0/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/ &

wget https://raw.githubusercontent.com/Arau/tutorials/mysql-ha/ha-mysql/assets/install-etcd.sh
echo ${ETCD_HOST} | bash install-etcd.sh

kubectl create -f https://github.com/storageos/cluster-operator/releases/download/v2.1.0/storageos-operator.yaml

kubectl create -f- <<END
apiVersion: v1
kind: Secret
metadata:
  name: "storageos-api"
  namespace: "storageos-operator"
  labels:
    app: "storageos"
type: "kubernetes.io/storageos"
data:
  # echo -n '<secret>' | base64
  apiUsername: c3RvcmFnZW9z
  apiPassword: c3RvcmFnZW9z
  # CSI Credentials
  csiProvisionUsername: c3RvcmFnZW9z
  csiProvisionPassword: c3RvcmFnZW9z
  csiControllerPublishUsername: c3RvcmFnZW9z
  csiControllerPublishPassword: c3RvcmFnZW9z
  csiNodePublishUsername: c3RvcmFnZW9z
  csiNodePublishPassword: c3RvcmFnZW9z
  csiControllerExpandUsername: c3RvcmFnZW9z
  csiControllerExpandPassword: c3RvcmFnZW9z
END

kubectl create -f- <<END
apiVersion: "storageos.com/v1"
kind: StorageOSCluster
metadata:
  name: "my-storageos-cluster"
  namespace: "storageos-operator"
spec:
  secretRefName: "storageos-api" # Reference from the Secret created in the previous step
  secretRefNamespace: "storageos-operator"  # Namespace of the Secret
  namespace: "kube-system"
  k8sDistro: "upstream"
  images:
    nodeContainer: "storageos/node:v2.1.0" # StorageOS version
  kvBackend:
    address: '${ETCD_HOST}:22379' # Example address, change for your etcd endpoint
  # address: '10.42.15.23:2379,10.42.12.22:2379,10.42.13.16:2379' # You can set ETCD server ips
  csi:
    enable: true
    deploymentStrategy: deployment
    enableControllerPublishCreds: true
    enableNodePublishCreds: true
    enableProvisionCreds: true
    enableControllerExpandCreds: true
  resources:
    requests:
    memory: "512Mi"
#  nodeSelectorTerms:
#    - matchExpressions:
#      - key: "node-role.kubernetes.io/worker" # Compute node label will vary according to your installation
#        operator: In
#        values:
#        - "true"
END

# DNS needs restarting in some executions of the 
# scenario
kubectl -n kube-system delete pod -lk8s-app=kube-dns &
