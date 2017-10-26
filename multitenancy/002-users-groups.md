User accounts facilitate granular permissioning of acceptable actions by users and groups.

StorageOS creates one administrator on initial startup, the `storageos` user. As you are logged in as `storageos`, you can perform any action within the system, including creating new users (you will need to set a password):

`storageos user create --role user devUser`{{execute}}

assigning them to groups:

`storageos user update --groups dev,test devUser`{{execute}}

and viewing all users:

 `storageos user ls`{{execute}}
