For this tutorial we will use the StorageOS CLI to explore the cluster. 

Open terminals on the second and third hosts:

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

Use `docker ps`{{execute}} to check that the StorageOS container is running on all three nodes.

On start-up, StorageOS nodes communicate with each other to discover the overall
status of the cluster and establish consensus. Check out the nodes in this cluster:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Capacity}}"`{{execute}}

Once all the nodes in the cluster report a capacity, the cluster is ready for
you to work with.

You can also use the GUI to see the nodes and their health. Just use the link
below and login as `user: storageos` `password: storageos`
https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/#/login

