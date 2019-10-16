MySQL is a popular SQL open source database for a wide range of popular web-based applications including WordPress.

In this tutorial, we'll look at how to configure it with StorageOS for high
availability and failover.

Start a MySQL container specifying StorageOS as the volume driver:

`docker run -d --name mysql-dev \
--volume-driver=storageos \
--volume myslqdata:/var/lib/mysql \
--env MYSQLDATA=/var/lib/mysql \
--env MYSQL_ROOT_PASSWORD=storageos mysql`{{execute}}

Note that StorageOS has dynamically provisioned the new volume `mysqldata`:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Status}}\t{{.MountedBy}}\t{{.Location}}"`{{execute}}