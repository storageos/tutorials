Now, as the admin user again, remove devUser from the dev group:

`storageos user --username=storageos --password=storageos update --remove-groups dev devUser`{{execute}}

Check devUser can no longer access the restricted namespace:

`storageos volume --username=devUser --password=[Enter password] create --namespace restricted shouldFail`{{execute}}
