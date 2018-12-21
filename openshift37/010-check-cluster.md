## Check StorageOS status

The StorageOS CLI presents useful information regarding the cluster and its volumes. 


1. Using StorageOS CLI: ``storageos node ls``{{execute}}

2. Check the health REST API endpoint directly by: ``curl 127.0.0.1:5706/health``{{execute}}

3. If the cluster is not healthy, then wait a few seconds for the cluster to start and run: `docker logs storageos`{{execute}}


