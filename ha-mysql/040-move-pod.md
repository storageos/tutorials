StorageOS handles the IO of the Volume and manges all network traffic when the
Pod and its data, the Volume primary location, are in separate nodes.

Lets see how the MySQL Pod can start in any node and access its data.

1. Find the node holding the Volume Primary data

    `node1=$(kubectl exec -n kube-system cli -- storageos get volume | grep pvc- | awk '{ print $5 }')`{{execute}}

1. Find the node where mysql is running

    `node2=$(kubectl get pod mysql -ocustom-columns=_:.spec.nodeName --no-headers)`{{execute}}
1. Cordon nodes

    `kubectl cordon $node1 $node2`{{execute}}

1. Delete MySQL Pod

    `kubectl delete pod mysql`{{execute}}

    > Wait until the Pod is deleted

1. Recreate the Pod

    `kubectl create -f mysql-pod1.yaml`{{execute}}

1. Check the new Pod location

    `kubectl get pod mysql -owide`{{execute}}

1. Check MySQL's data

    `kubectl exec mysql -- /bin/sh -c "mysql -e \"select * from shop.FRUIT\""`{{execute}}
