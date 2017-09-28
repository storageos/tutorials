Using StorageOS volumes to a database is easy, just add `--volume-driver=storageos` to your standard docker run command.

Run Postgres with StorageOS volumes:

`docker run -d --name postgres \
--volume-driver=storageos \
-v pgdata:/var/lib/postgresql/data \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-e POSTGRES_PASSWORD=storageos postgres`{{execute}}
