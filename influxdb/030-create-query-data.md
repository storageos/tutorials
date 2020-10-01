In this final stage of the tutorial, you will use the instance of InfluxDB
that you have installed alongside StorageOS, to create and query time series
data within the kubernetes cluster.

Begin by connect to the client pod (your prompt will change), which as
previously stated offers a convenient method via which to interact with
the InfluxDB host.

`kubectl exec -it influxdb-client -- bash`{{execute}}

Once within the InfluxDB client pod, you can connect to the InfluxDB
host with the following command.

`influx -host influxdb-0.influxdb`{{execute}}

Authenticate your user (use "admin" for both user and password when
prompted):

`auth`{{execute}}

Create a test database called <em>weather</em>.

`CREATE DATABASE weather;`{{execute}}

Connect to the database and insert some sample data:

`USE weather;`{{execute}}

`INSERT temperature,location=London value=26.4
INSERT temperature,location=London value=24.9
INSERT temperature,location=London value=22.2
INSERT temperature,location=London value=14.7
INSERT temperature,location=London value=19.5
INSERT temperature,location=Paris value=27.1
INSERT temperature,location=Paris value=27.5
INSERT temperature,location=Paris value=21.3
INSERT temperature,location=Paris value=26.7
INSERT temperature,location=Paris value=30.0`{{execute}}

You can now use the inserted values to generate statistical insights from the
dataset.

`SELECT MEAN(*) FROM "temperature" GROUP BY "location"'`{{execute}}

You have successfully installed InfluxDB in kubernetes
with StorageOS, then used a separate client pod to connect to the database
and to create and query data. Congratulations! 