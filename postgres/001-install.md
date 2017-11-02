PostgreSQL or “Postgres” is an open source object-relational database management
system (ORDBMS). It's deployed across a wide variety of platforms with a mix of
workloads ranging from small, single-node use cases to large Internet-facing
with many concurrent users.

In this tutorial, we'll look at how to configure it with StorageOS for high
availability and failover.

Start a Postgres container with the `--volume-driver=storageos` flag:

`docker run -d --name postgres-dev \
--volume-driver=storageos \
-v pgdata:/var/lib/postgresql/data \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-e POSTGRES_PASSWORD=storageos postgres`{{execute}}

Note that StorageOS has created the new volume `pgdata`. This is known as dynamic provisioning:
`storageos volume ls`{{execute}}
