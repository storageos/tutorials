Developers can request storage using persistent volume claims.

Create PersistentVolumeClaim and a MySQL pod which references the `fast` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}

`kubectl create -f mysql-pod1.yaml`{{execute}}

You should see a StorageOS persistent volume:

`kubectl describe pv`{{execute}}

> Usually takes ~30 seconds to come up after it's been created.

You can also confirm StorageOS provisioned the volume with the CLI:

`storageos volume ls --format "table {{.Name}}\t{{.Size}}\t{{.Replicas}}\t{{.Location}}"`{{execute}}

The link between the PersistentVolumeClaim and the pod comes from the pod
referencing the PersistentVolumeClaim in the pod's yaml definition.

Run the command to see the mysql-pod definition. 

`cat mysql-pod1.yaml`{{execute}}

You can see that the PersistentVolumeClaim claimName has been set to `mysqlpvc`.

Run the command to see the PersistentVolumeClaim definition. 

`cat storageos-pvc.yaml`{{execute}}

Notice that the PersistentVolumeClaim name is `mysqlpvc`.

Check the pods are in RUNNING state:

`kubectl get pods -w`{{execute}}

> The above command watches the pod created in the default namespace. Press `Ctrl+C` to continue once the pods are up.