Admins can create users (pick a password when prompted):

`storageos user create --role user devUser`{{execute}}

assign them to groups:

`storageos user update --groups dev,test devUser`{{execute}}

and view all users:

`storageos user ls`{{execute}}

Note that devUser with a `user` role, which means they only have the ability to change their password and have access to the namespaces granted to them via policies. The policy we created allows the `dev` group to create and list volumes in the restricted namespace:

`storageos -u devUser -p [...] volume create --namespace restricted myvol`{{execute}}
`storageos -u devUser -p [...] volume ls`{{execute}}

Note that you can run commands as a specific user by passing their username and password as flags.
