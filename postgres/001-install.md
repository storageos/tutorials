It's straightforward to run Postgres with StorageOS volumes with the `--volume-driver=storageos` flag:

Run Postgres with StorageOS volumes:

`docker run -d --name postgres-dev \
--volume-driver=storageos \
-v pgdata:/var/lib/postgresql/data \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-e POSTGRES_PASSWORD=storageos postgres`{{execute}}

Confirm Postgres is up and running:

`docker logs postgres-dev`{{execute}}
