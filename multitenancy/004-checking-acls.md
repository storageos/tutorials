Now, as the admin user again, remove devUser from the dev group:

`storageos -u storageos -p storageos user update --remove-groups dev devUser`{{execute}}
`storageos -u storageos -p storageos user ls`{{execute}}

Note that you can also run individual commands as a specific user by passing
their username and password as flags.

Now `devUser` should no longer be able to create volumes in `restricted`:

`storageos -u devUser -p <password> volume create --namespace restricted shouldFail`{{execute}}
