Kill the SQL Server container:

`docker kill mssql`{{execute}}

Open a host on the second node and start a new instance of SQL Server:

`ssh root@host02`{{execute T2}}
`docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=p@ssw0rd' -p 1433:1433 \
    --name mssql -v mssql:/var/opt/mssql --volume-driver=storageos \
    -d microsoft/mssql-server-linux`{{execute T2}}

Check the data was successfully persisted:

`docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -U SA -P p@ssw0rd`{{execute T2}}
`use testdb`{{execute T2}}
`SELECT * FROM inventory`{{execute T2}}

Add new data:

`INSERT INTO inventory VALUES (3, 'apple', 99);`{{execute T2}}
`SELECT * FROM inventory`{{execute T2}}
