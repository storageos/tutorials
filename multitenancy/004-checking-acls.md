Now, as the admin user again, remove devUser from the dev group:

`storageos user update --remove-groups dev devUser`{{execute}}

Check devUser can no longer access the restricted namespace:

`storageos -u devUser -p [...] volume create --namespace restricted shouldFail`{{execute}}
