Admins can grant access to namespaces to users with simple Attribute-Based Access Controls called policies.

Create a policy to allow the `dev` group to access the `restricted` namespace:

`storageos policy create --group dev --namespace restricted`{{execute}}

`storageos policy ls`{{execute}}

Since `devUser` is in the `dev` group, you can login as `devUser`:

You can either login to the WebGUI or you can login on the command line

https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/

If you log into the WebGUI as the devUser you will be automatically put into
the `restricted` namespace. You can then create a volume using the GUI. 

Alternatively login as devUser using the CLI.

`storageos login [[HOST_IP]]`{{execute}}

and create and list volumes in `restricted`:

`storageos volume create --namespace restricted myvol`{{execute}}
`storageos volume ls --namespace restricted`{{execute}}
