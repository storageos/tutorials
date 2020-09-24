The next step is to create an InfluxDB host pod, a service that exposes port
8086 on that pod, and a client pod for interaction with the host.

Create the service account, service, StatefulSet and client pod from their
respective yaml files:

`kubectl create -f ./`{{execute}}

You should now be able to view the running InfluxDB host and client pods:

`kubectl get pods`{{execute}}

```bash
NAME         READY   STATUS        RESTARTS   AGE
client       1/1     Running       0          5s
influxdb-0   1/1     Running       0          5s
```
