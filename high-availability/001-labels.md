`storageos volume create --namespace default --label env=prod volume-name`{{execute}}

`storageos volume inspect default/volume-name`{{execute}}

`storageos volume update --label-add env=dev default/volume-name`{{execute}}
