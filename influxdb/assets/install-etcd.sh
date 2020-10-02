while read line
do
  export ETCD_HOST=$line
done < "${1:-/dev/stdin}"

export ETCD_VERSION="3.4.9"
export CLIENT_PORT="2379"
export PEERS_PORT="2380"
export NODE_IP=${ETCD_HOST}
export NODE1_IP=${ETCD_HOST}
export CLIENT_PORT=${CLIENT_PORT}
export PEERS_PORT=${PEERS_PORT}

curl -L https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz
mkdir -p /tmp/etcd-v${ETCD_VERSION}-linux-amd64
tar -xzvf /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -C /tmp/etcd-v${ETCD_VERSION}-linux-amd64 --strip-components=1
rm /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz

cd /tmp/etcd-v${ETCD_VERSION}-linux-amd64
mv etcd /usr/local/sbin/etcd3
mv etcdctl /usr/local/sbin/etcdctl
chmod 0755 /usr/local/sbin/etcd3 /usr/local/sbin/etcdctl

mkdir /var/lib/storageos-etcd

cat <<END > /etc/etcd.conf
# NODE_IP is the IP of the node where this file resides.
NODE_IP=${ETCD_HOST}
# Node 1 IP
NODE1_IP=${ETCD_HOST}
CLIENT_PORT=${CLIENT_PORT}
PEERS_PORT=${PEERS_PORT}
END

cat <<END > /etc/systemd/system/etcd3.service
[Unit]
Description=etcd3
Documentation=https://github.com/coreos/etcd
Conflicts=etcd2.service

[Service]
Type=notify
Restart=always
RestartSec=5s
LimitNOFILE=40000
TimeoutStartSec=0
EnvironmentFile=/etc/etcd.conf

ExecStart=/usr/local/sbin/etcd3 --name etcd-${NODE_IP} \
    --data-dir /var/lib/storageos-etcd \
    --quota-backend-bytes 8589934592 \
    --auto-compaction-retention 1000 \
    --auto-compaction-mode revision \
    --initial-cluster-state new \
    --initial-cluster-token etcd-token \
    --listen-client-urls http://${NODE_IP}:${CLIENT_PORT},http://127.0.0.1:2379 \
    --advertise-client-urls http://${NODE_IP}:${CLIENT_PORT} \
    --listen-peer-urls http://${NODE_IP}:${PEERS_PORT} \
    --initial-advertise-peer-urls http://${NODE_IP}:${PEERS_PORT} \
    --initial-cluster etcd-${NODE1_IP}=http://${NODE1_IP}:${PEERS_PORT}


[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable etcd3.service
systemctl start  etcd3.service

ETCDCTL_API=3 etcdctl --endpoints=http://127.0.0.1:2379 member list

echo "ETCD has been installed"