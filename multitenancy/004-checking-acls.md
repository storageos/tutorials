Now, as the admin user again, remove devUser from the dev group:

`storageos -u storageos -p storageos user update --remove-groups dev devUser`{{execute}}
`storageos user ls`{{execute}}

Note that you can also run commands as a specific user by passing their username and
password as flags.

Now you should no longer be able to create volumes in the restricted namespace:

`storageos volume create --namespace restricted shouldFail`{{execute}}
