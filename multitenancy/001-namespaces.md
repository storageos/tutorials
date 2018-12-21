Namespaces help different projects or teams share a StorageOS cluster by isolating volumes or rules. One namespace is created on startup, the `default` namespace:

`storageos namespace ls`{{execute}}

You can create new namespaces with the `storageos namespace` command:

`storageos namespace create restricted`{{execute}}

To create a volume in the new namespace, set the `--namespace` flag:

`storageos volume create --namespace restricted vol`{{execute}}

and view the namespaced volume:

`storageos volume ls`{{execute}}


All of the management done with the CLI in this example can also be done using
the GUI. You can access the GUI using the link below and login as User:
storageos with password: storageos
https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/
