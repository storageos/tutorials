Namespaces help different projects or teams share a StorageOS cluster by isolating volumes or rules. One namespace is created on startup, the `default` namespace:

`storageos namespace ls`{{execute}}

Create a new namespace:

`storageos namespace create restricted`{{execute}}

To create a volume in the new namespace, set the `--namespace` flag:

`storageos volume create --namespace restricted vol`{{execute}}

View the new volume:

`storageos volume ls`{{execute}}
