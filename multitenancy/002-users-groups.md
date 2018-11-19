Administrators manage access to namespaces via users and groups. One admin is
created on initial startup, the `storageos` user. As you are already logged in
as `storageos`, you can perform any action within the system, including creating
users (pick a password when prompted):

`storageos user create --role user devUser`{{execute}}

 assigning them to groups:

`storageos user update --groups dev,test devUser`{{execute}}

and viewing all users:

`storageos user ls`{{execute}}

Users with the `user` role can only access namespaces granted to them, and
change their own password.

