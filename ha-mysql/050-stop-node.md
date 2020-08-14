StorageOS implements synchronous replication and automatic failover.

Lets cause node downtime and see how StorageOS heals the Volume automatically.

1. The node $node1 holds the primary location

    `echo $node1`{{execute}}

1. Check where the StorageOS replica is located

    `kubectl exec -n kube-system -- storageos get volume -oyaml`{{execute}}

    > Note the section `replicas.nodeName`

1. SSH into the node

    `ssh $node1`{{execute}}

1. Reboot the node

    `reboot`{{execute}}


    > The promt goes back to the master shell cli

    Wait a few seconds for the Node to stop

1. Check that StorageOS sees the node as "Offline"

    `kubectl exec -n kube-system -- storageos get node`{{execute}}

    > As soon as the Node is shutdown, StorageOS detects the node failure

1. Check the location of the StorageOS Volume Primary and Replica

    `kubectl exec -n kube-system -- storageos get volumes -oyaml`{{execute}}

    > A previous replica has been promoted to master and keeps serving the
    > data.


1. Check the MySQL Pod and its data

    `kubectl get pod`{{execute}} 

    `kubectl exec mysql -- /bin/sh -c "mysql -e \"select * from shop.fruit\""`{{execute}}


Congratulations you have failedover a Volume without downtime!
