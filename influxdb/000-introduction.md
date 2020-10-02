
In this tutorial we will be installing InfluxDB inside Kubernetes using StorageOS volumes. InfluxDB is a time series database that is optimised
for managing datasets consisting of many small measurements. Its advantages
include the ability to handle very high write and query loads. Its uses include
monitoring, analytics and the recording and analysis of data from sensors. It is a highly suitable workload to run on StorageOS.

In the stages that follow, we will create a host pod to serve InfluxDB requests, and a client pod with which to interact with the host. The scenario draws inspiration from our use case in the [StorageOS documentation](https://docs.storageos.com/docs/usecases/influxdb/). The yaml source files available
in the environment are identical to those in the [github repository](https://github.com/storageos/use-cases/tree/master/influxdb) that is checked out
as part of the use case.

This sandbox environment is a fully configured 3 node Kubernetes cluster with StorageOS installed at runtime. Please wait for the initialisation to complete before attempting to begin the tutorial - this will take a few minutes.
