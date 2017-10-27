Install MS SQL Server container with a StorageOS persistent volume:

`docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=p@ssw0rd' -p 1433:1433 \
    --name mssql -v mssql:/var/opt/mssql --volume-driver=storageos \
    -d microsoft/mssql-server-linux`{{execute}}

Confirm SQL Server installation status:

`docker logs mssql | more`{{execute}}

Confirm a StorageOS volume was created successfully:

`storageos volume ls`{{execute}}
