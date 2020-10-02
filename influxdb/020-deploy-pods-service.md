InfluxDB can be installed using its official image on Docker Hub. The
container that is built from this image is defined in the StatefulSet YAML file. The manifest files also define a service that exposes port 8086 on that pod, and a client pod for interaction with the host.

Clone the StorageOS usecases repository into the local environment.

`
git clone https://github.com/storageos/use-cases.git storageos-usecases
cd storageos-usecases
`{{execute}}

You will also need to change the storage class in the stateful set to
"storageos", as this is the storage class we are using for this
tutorial.

`sed -i 's/fast/storageos/g' influxdb/20-statefulset.yaml`{{execute}}

For more information about storage classes, visit the
[StorageOS documentation](https://docs.storageos.com/docs/operations/storageclasses/).

Run the following command to install InfluxDB from the manifest files.

`kubectl create -f ./influxdb`{{execute}}

You should now be able to view the running InfluxDB host and client pods:

`kubectl get pods`{{execute}}

```bash
NAME                  READY   STATUS        RESTARTS   AGE
influxdb-client       1/1     Running       0          5s
influxdb-0            1/1     Running       0          5s
```

You have succesfully created an InfluxDB database within your cluster.
In the next step we will look at some examples of creating and querying data.