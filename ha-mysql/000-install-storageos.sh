launch.sh
export ETCD_HOST=[[HOST1_IP]]

echo "Installing StorageOS and ETCD"

sleep 5

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

## Deploy CLI
kubectl create -f-<<END
apiVersion: apps/v1
kind: Deployment
metadata:
  name: storageos-cli
  namespace: kube-system
  labels:
    app: storageos
spec:
  replicas: 3
  selector:
    matchLabels:
      app: storageos-cli
  template:
    metadata:
      labels:
        app: storageos-cli
    spec:
      containers:
      - command:
        - /bin/sh
        - -c
        - "while true; do sleep 3600; done"
        env:
        - name: STORAGEOS_ENDPOINTS
          value: http://[[HOST2_IP]]:5705,http://[[HOST3_IP]]:5705,http://[[HOST4_IP]]:5705
        - name: STORAGEOS_USERNAME
          value: storageos
        - name: STORAGEOS_PASSWORD
          value: storageos
        image: storageos/cli:v2.1.0
        name: cli
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - storageos-cli
            topologyKey: "kubernetes.io/hostname"
END

