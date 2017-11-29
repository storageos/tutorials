Admins can grant access to namespaces to users with simple Attribute-Based Access Controls called policies.

Create a policy to allow the `dev` group to access the `restricted` namespace:

`storageos policy create --group dev --namespace restricted`{{execute}}
`storageos policy ls`{{execute}}

Since `devUser` is in the `dev` group, you can login as `devUser`:

`storageos login [[HOST_IP]]`{{execute}}

and create and list volumes in `restricted`:

`storageos volume create --namespace restricted myvol`{{execute}}
`storageos volume ls --namespace restricted`{{execute}}
