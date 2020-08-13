The next step is to create a MySQL pod that uses ephemeral storage and a MySQL pod that uses persistent storage provisioned by StorageOS.

Create a MySQL with ephemeral storage:

`kubectl create -f mysql-pod1.yaml`{{execute}}

Create PersistentVolumeClaim and a MySQL pod which references the `fast` StorageClass:

`kubectl create -f storageos-pvc.yaml`{{execute}}

`kubectl create -f mysql-pod2.yaml`{{execute}}

You should see a StorageOS persistent volume:

`kubectl describe pv`{{execute}}

> Usually takes ~30 seconds to come up after it's been created.

You can also confirm StorageOS provisioned the volume with the CLI:

`kubectl exec -ti cli -n kube-system -- storageos get volume`{{execute}}

The link between the PersistentVolumeClaim and the pod comes from the pod
referencing the PersistentVolumeClaim in the pod's yaml definition.

Run the command to see the ephemeral mysql pod definition:

`cat mysql-pod1.yaml`{{execute}}

Now compare it with the persistent mysql pod definition. 

`cat mysql-pod2.yaml`{{execute}}

You can see that the PersistentVolumeClaim claimName has been set to `mysqlpvc`.

Run the command to see the PersistentVolumeClaim definition. 

`cat storageos-pvc.yaml`{{execute}}

Notice that the PersistentVolumeClaim name is `mysqlpvc`.

Check the pods are in RUNNING state:

`kubectl get pods -w`{{execute}}

> The above command watches the pod created in the default namespace. Press `Ctrl+C` to continue once the pods are up.