Policies are a simple Attribute-Based Access Control records that are used to permission users (or groups) to namespaces. As an admin, you can enable all users in the test group to access the restricted namespace:

`storageos policy create --group dev --namespace restricted`{{execute}}

To log in as different users, set the `--username` and `--password` flags on any command.

Check that devUser can create and list volumes in the restricted namespace:

`storageos volume --username=devUser --password=[Enter password] create --namespace restricted myvol`{{execute}}
`storageos volume --username=devUser --password=[Enter password] ls`{{execute}}
