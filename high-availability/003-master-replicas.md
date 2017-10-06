StorageOS is based on a hybrid architecture, with a single master (which ensures deterministic performance) and distributed replicas (for high availability).

See where StorageOS scheduled the master and replica to:

`storageos node ls --format "table {{.Name}}\t{{.Address}}\t{{.Volumes}}"`{{execute}}

You can set 0-5 replicas per volume, which enables data to be protected against 0-5 node failures. Typically one replica is sufficient for testing or small deployments.
