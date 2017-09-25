`storageos volume create --label storageos.feature.replicas=1 replicated`{{execute}}

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Volumes}}"`{{execute}}
