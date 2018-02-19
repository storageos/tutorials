Right now `default/testvol` resides on one node. You can find out the location:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

If this node goes down, `default/testvol` will be unavailable. You can replicate the data to different nodes to ensure that `default/testvol` will still be available even if nodes fail.

You can add, update or remove labels at any time. Replication is controlled by a special label, `storageos.com/replicas`. Add a replica to testvol:

`storageos volume update --label-add storageos.com/replicas=1 default/testvol`{{execute}}
