Labels are a mechanism for applying metadata to StorageOS objects. You can use them to annotate or organise your volumes in any way that makes sense for your organization or app.

A label is a key-value pair that is stored as a string.

Create a volume labelled env=prod:

`storageos volume create --label env=prod testvol`{{execute}}

Inspect the volume to see the labels:

`storageos volume inspect default/testvol`{{execute}}
