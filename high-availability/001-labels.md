`storageos volume create --label env=prod testvol`{{execute}}

`storageos volume inspect default/testvol`{{execute}}

`storageos volume update --label-add env=dev default/testvol`{{execute}}
