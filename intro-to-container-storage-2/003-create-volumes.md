Now you can create a volume using the StorageOS volume driver:

`docker volume create --driver storageos testvol`{{execute HOST1}}

Passing `--driver` tells Docker to use StorageOS to manage the volume. Under the hood, StorageOS has created a storage pool across the cluster.

The test volume is visible on all hosts:

`docker volume ls`{{execute HOST1}}
`docker volume ls`{{execute HOST2}}
`docker volume ls`{{execute HOST3}}
