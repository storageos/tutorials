StorageOS implements synchronous replication and automatic failover.

Lets cause node downtime and see how StorageOS heals the Volume automatically.

1. The node $node1 holds the primary location

    `echo $node1`{{execute}}

1. Check where the StorageOS replica is located

    `storageos get volume -oyaml`{{execute}}

    > Note the section `replicas.nodeName`

1. Remove the node to be stopped from the StorageOS CLI endpoint

    ```
   ip=$(kubectl get node -owide | grep $node1 | awk '{print $6}')

   export $(echo STORAGEOS_ENDPOINTS="http://[[HOST2_IP]]:5705,http://[[HOST3_IP]]:5705,http://[[HOST4_IP]]:5705" | sed "s#http://$ip:5705,##g")
    ```{{execute}}

1. SSH into the node

    `ssh -o StrictHostKeyChecking=no $node1`{{execute}}

1. Reboot the node

    `reboot`{{execute}}

    > The promt goes back to the master shell cli

