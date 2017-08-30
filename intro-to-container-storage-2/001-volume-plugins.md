If you've run through the Introduction to Container Storage Part 1, you'll know that if you want your data to persist beyond the lifetime of a container, you should store it in volumes. To persist data across hosts, you need volume plugins.

Volume plugins allow you to integrate external storage or persist storage across a cluster.

To see installed plugins:
`docker plugin ls`{{execute}}

We need to install one from the Docker Hub.
