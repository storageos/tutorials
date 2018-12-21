In this tutorial, you will install StorageOS on a three node Docker cluster.
Open up terminals for the second and third host (type `yes` where prompted):

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

The StorageOS CLI has already been installed and the environment variables have
been set:
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=[[HOST_IP]]`{{execute T1}}
