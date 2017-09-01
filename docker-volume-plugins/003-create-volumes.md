Passing `--driver` tells Docker to use StorageOS to manage the volume. To create the volume, use:

`docker volume create --driver storageos testvol`{{execute}}

`docker volume ls`{{execute}}
