Now, as the admin user again, remove devUser from the dev group:

`storageos user update --remove-groups dev devUser`{{execute}}
`storageos user ls`{{execute}}

Check devUser can no longer create volumes in the restricted namespace:

`storageos -u devUser -p [...] volume create --namespace restricted shouldFail`{{execute}}
