`ssh root@host03`{{execute T3}}
`export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost`{{execute T3}}


`storageos volume create --label env=prod testvol`{{execute}}

`storageos volume inspect default/testvol`{{execute}}

`storageos volume update --label-add env=dev default/testvol`{{execute}}
