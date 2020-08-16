StorageOS implements synchronous replication and automatic failover.

Lets cause node downtime and see how StorageOS heals the Volume automatically.

1. Restart the StorageOS CLI (Optional)

    If the CLI is scheduled in the node to be stopped, we should recreate a new
    CLI Pod.

    `kubectl -n kube-system delete pod cli --force --grace-period 0`{{execute}}

    And recreate the Pod.

    `kubectl -n kube-system run \
    --image storageos/cli:v2.1.0 \
    --restart=Never                          \
    --env STORAGEOS_ENDPOINTS=http://storageos:5705 \
    --env STORAGEOS_USERNAME=storageos       \
    --env STORAGEOS_PASSWORD=storageos       \
    --command cli                            \
    -- /bin/sh -c "while true; do sleep 999999; done"`{{execute}}

1. The node $node1 holds the primary location

    `echo $node1`{{execute}}

1. Check where the StorageOS replica is located

    `kubectl exec -n kube-system cli -- storageos get volume -oyaml`{{execute}}

    > Note the section `replicas.nodeName`

1. SSH into the node

    `ssh -o StrictHostKeyChecking=no $node1`{{execute}}

1. Reboot the node

    `reboot`{{execute}}

    > The promt goes back to the master shell cli

