If you've run through the Introduction to Container Storage Part 1, you'll know that if you want your data to persist beyond the lifetime of a container, you should store it in volumes. To persist data beyond the lifetime of one host, you need volume plugins.

Volume plugins allow you to integrate external storage or persist storage across hosts.

To see your available plugins:
`docker plugin ls`{{execute}}

We'll use the `StorageOS` plugin.

`docker plugin inspect storageos`{{execute}}
