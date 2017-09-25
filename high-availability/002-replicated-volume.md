`storageos volume create --namespace default --label storageos.feature.replicas=2 volume-name`{{execute}}

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Location}}"`{{execute}}

`storageos volume inspect default/volume-name`{{execute}}
