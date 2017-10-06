Right now `default/testvol` resides on one node. You can find out the location:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

If this node goes down, `default/testvol` will be unavailable. You can replicate the data to different nodes to ensure that `default/testvol` will still be available even if nodes fail.

Replication is controlled by a special label, `storageos.feature.replicas`. Create a single replica using the label:

`storageos volume update --label storageos.feature.replicas=1 default/testvol`{{execute}}
