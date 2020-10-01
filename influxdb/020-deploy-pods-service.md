InfluxDB can be installed using its official image on Docker Hub. The
container that is built from this image is defined in the StatefulSet YAML file.
This is used to create an InfluxDB host pod. The manifest files also define a
service that exposes port 8086 on that pod, and a client pod for interaction
with the host.

All these files are available in the the
[StorageOS usecases GitHub repository]
(https://github.com/storageos/use-cases/tree/master/mysql). Clone this
into the local environment, then change directory into the newly-created
`storageos-usecases`.

`
git clone https://github.com/storageos/use-cases.git storageos-usecases
cd storageos-usecases
`{{execute}}


These manifests are also the basis for the
[InfluxDB usecase](https://docs.storageos.com/docs/usecases/influxdb/)
which is available in the StorageOS documentation. 

To build the resources for this stage of the tutorial, create the service
account, service, StatefulSet and InfluxDB client pod from their respective
yaml files (i.e. the files in the current working directory).

`kubectl create -f ./influxdb`{{execute}}

You should now be able to view the running InfluxDB host and client pods:

`kubectl get pods`{{execute}}

```bash
NAME                  READY   STATUS        RESTARTS   AGE
influxdb-client       1/1     Running       0          5s
influxdb-0            1/1     Running       0          5s
```

You have now succesfully created an InfluxDB client pod, from which you can
connect to the InfluxDB host to and interact with the database. In the next
step we will look at some examples of creating and querying data.