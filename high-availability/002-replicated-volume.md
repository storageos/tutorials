Special labels prefixed with `storageos.feature` control features such as replication.

Create a volume with a single replica (ie. can survive one node failure):

`storageos volume create --label storageos.feature.replicas=1 replicated`{{execute}}

See where StorageOS scheduled the master and replica to:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Volumes}}"`{{execute}}
