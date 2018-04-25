In this scenario you will provision replicated volumes on a three node StorageOS cluster. Open terminals on the second and third host:

`ssh root@host02`{{execute T2}}
`ssh root@host03`{{execute T3}}

Labels are a mechanism for applying metadata to StorageOS objects. You can use them to annotate or organise your volumes in any way that makes sense for your organization or app.

A label is a key-value pair that is stored as a string.

Create a volume expected to run in a production environment:

`storageos volume create --label env=prod testvol`{{execute}}

Inspect the volume to see the labels:

`storageos volume inspect default/testvol`{{execute}}
