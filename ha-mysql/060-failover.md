1. Check that StorageOS sees the node as "Offline"

    `storageos get node`{{execute}}

    > As soon as the Node is shutdown, StorageOS detects the node failure

1. Check the location of the StorageOS Volume Primary and Replica

    `storageos get volumes -oyaml`{{execute}}

    > A previous replica has been promoted to master and keeps serving the
    data.

1. Check the MySQL Pod and its data

    `kubectl get pod`{{execute}} 

    `kubectl exec mysql -- /bin/sh -c "mysql -e \"select * from shop.FRUIT\""`{{execute}}


Congratulations you have failedover a Volume without downtime!
