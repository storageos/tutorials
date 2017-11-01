Admins can create simple Attribute-Based Access Controls called policies.

Grant `dev` groups access to the `restricted` namespace:

`storageos policy create --group dev --namespace restricted`{{execute}}

Since `devUser` is in the `dev` group, they can create and list volumes in the
restricted namespace:

`storageos -u devUser -p [...] volume create --namespace restricted
myvol`{{execute}}
`storageos -u devUser -p [...] volume ls`{{execute}}

Note that you can run commands as a specific user by passing their username and
password as flags.
