In this final stage of the tutorial, you will use InfluxDB to create and query time series data within the Kubernetes cluster.

Begin by connecting to the client pod:

`kubectl exec -it influxdb-client -- bash`{{execute}}

Use the InfluxDB client to connect to the host database.

`influx -host influxdb-0.influxdb`{{execute}}

Authenticate your user (use "admin" for both user and password when
prompted):

`auth`{{execute}}

Create a test database called <em>weather</em>.

`CREATE DATABASE weather;`{{execute}}

Connect to the database and insert some sample time series data.
Here we are inserting the temperature at two locations.

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

`SELECT MEAN(*) FROM "temperature" GROUP BY "location"`{{execute}}

Congratulations! You have successfully installed InfluxDB in Kubernetes
with StorageOS, then used a separate client pod to connect to the database
and to create and query data. 