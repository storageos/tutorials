StorageOS handles the IO of the Volume and manges all network traffic when the
Pod and its data, the Volume primary location, are in separate nodes.

Lets see how the MySQL Pod can start in any node and access its data.

1. Find the node holding the Volume Primary data

    `node1=$(storageos get volume | grep pvc- | awk '{ print $5 }')`{{execute}}

1. Find the node where mysql is running

    `node2=$(kubectl get pod mysql -ocustom-columns=_:.spec.nodeName --no-headers)`{{execute}}

1. Cordon nodes

    `echo $node1 $node2`{{execute}}

    `kubectl cordon $node1 $node2`{{execute}}

1. Delete MySQL Pod

    `kubectl delete pod mysql`{{execute}}

    > Wait until the Pod is deleted

1. Recreate the Pod

    `kubectl create -f mysql-pod1.yaml`{{execute}}

    > Because we cordoned the node where MySQL was running, the Pod is forced
     to start in a different one.

1. Check the new Pod location

    `kubectl get pod mysql -owide -w`{{execute}}

1. Check MySQL's data

    `kubectl exec mysql -- /bin/sh -c "mysql -e \"select * from shop.FRUIT\""`{{execute}}

Congratulations, you have moved the application while its data remains
accessible!
