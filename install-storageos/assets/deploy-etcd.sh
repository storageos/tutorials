#!/bin/bash

export ROLE_NAME=etcd-operator
export ROLE_BINDING_NAME=etcd-operator
export NAMESPACE=etcd

git clone https://github.com/coreos/etcd-operator.git /tmp/etcd-operator
cd /tmp/etcd-operator

kubectl create namespace $NAMESPACE

./example/rbac/create_role.sh
kubectl -n $NAMESPACE create -f- <<END
apiVersion: apps/v1
kind: Deployment
metadata:
  name: etcd-operator
spec:
  replicas: 1
  selector:
    matchLabels:
      name: etcd-operator
  template:
    metadata:
      labels:
        name: etcd-operator
    spec:
      containers:
      - name: etcd-operator
        image: quay.io/coreos/etcd-operator:v0.9.4
        command:
        - etcd-operator
        # Uncomment to act for resources in all namespaces. More information in doc/user/clusterwide.md
        #- -cluster-wide
        env:
        - name: MY_POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: MY_POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
END

sleep 10

phase="$(kubectl -n $NAMESPACE get pod -lname=etcd-operator --no-headers -ocustom-columns=status:.status.phase)"
while ! grep -q "Running" <(echo "$phase"); do
    sleep 2
    phase="$(kubectl -n $NAMESPACE get pod -lname=etcd-operator --no-headers -ocustom-columns=status:.status.phase)"
done

kubectl -n $NAMESPACE create -f- <<END
apiVersion: "etcd.database.coreos.com/v1beta2"
kind: "EtcdCluster"
metadata:
  name: "storageos-etcd"
spec:
  size: 1
  version: "3.3.13"
  pod:
    etcdEnv:
    - name: ETCD_QUOTA_BACKEND_BYTES
      value: "2589934592"  # ~2 GB
    - name: ETCD_AUTO_COMPACTION_MODE
      value: "revision"
    - name: ETCD_AUTO_COMPACTION_RETENTION
      value: "100"
    resources:
      requests:
        cpu: 200m
        memory: 300Mi
    securityContext:
      runAsNonRoot: true
      runAsUser: 9000
      fsGroup: 9000
END

# DNS in Katacoda sometimes fails to start properly so etcd init container
# to check the headless svc needs restarting
kubectl -n kube-system delete pod -l k8s-app=kube-dns &>/dev/null
