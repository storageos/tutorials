Connect to the client pod (your prompt will change).

`$ kubectl exec -it client -- bash`{{execute}}

Connect to the InfluxDB host and authenticate.

`influx -host influxdb-0.influxdb`{{execute}}

Create a test database called <em>weather<em>.

`CREATE DATABASE weather;`{{execute}}

Now connect to the database and insert some sample data:

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

`SELECT MEAN(*) FROM "temperature" WHERE "location"='Paris'`{{execute}}
`SELECT MEAN(*) FROM "temperature" WHERE "location"='London'`{{execute}}