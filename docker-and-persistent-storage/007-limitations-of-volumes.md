There are a number of issues to be aware of when using volumes and data containers.

Orphan storage -- Currently it is possible to remove (delete) a container without deleting related volumes. In fact, this is the default behaviour unless specifically overridden. This makes it easy to end up with orphan volumes that have no referenced container.

Cleaning up orphan storage is currently a difficult task that requires trawling through the container configuration files to match up containers and their associated volumes.

Security -- There is no additional security on volumes or data containers other than standard Unix file permissions and the option to configure read-only or read-write access. This means file access permissions for users on the containers needs to match the host settings.

Data integrity -- Sharing data using volumes and data containers provides for no level of data integrity protection. Features such as file locking need to be managed by the containers themselves. This represents an additional overhead that must be added to the application.

Docker provides no data protection facilities, such as snapshots or replication, so data management has to be handled by the host or the container.

Lack of support for external storage -- There is no specific support within Docker for external storage other than the features provided by the host operating system. Docker volumes are stored by default in the /var/lib/docker directory, which can become a capacity and performance bottleneck. However, it is possible to change this location using a switch at startup of the Docker daemon.
