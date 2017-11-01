Admins can create simple Attribute-Based Access Controls called policies.

Grant `dev` groups access to the `restricted` namespace:

`storageos policy create --group dev --namespace restricted`{{execute}}

Since `devUser` is in the `dev` group, you can login as `devUser`:

`storageos login localhost`

and create and list volumes in the restricted namespace:

`storageos volume create --namespace restricted myvol`{{execute}}
`storageos volume ls`{{execute}}
