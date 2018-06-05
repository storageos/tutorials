## Check StorageOS status

StorageOS cli presents useful information regarding the cluster and its volumes. 

Using storageos cli: ``storageos --host 127.0.0.1 -u $STORAGEOS_USER -p $STORAGEOS_PASSWORD cluster health``{{execute}}

It is possible to check the health rest api endpoint by: ``curl 127.0.0.1:5706/health``{{execute}}

StorageOS container might take a few seconds to start. If the container is not ready, you will not see a healthy output. You can check StorageOS container status
by running: `docker logs storageos`{{execute}}


