Now delete both pods and recreate them:

`kubectl delete pod mysql-persistent`{{execute}}

`kubectl delete pod mysql-ephemeral`{{execute}}

Make sure that they are deleted:

`kubectl get pods`{{execute}}

And now recreate the pods:

`kubectl create -f mysql-pod1.yaml`{{execute}}

`kubectl create -f mysql-pod2.yaml`{{execute}}

Wait for the pods to finish spinning up:

`kubectl get pods -w`{{execute}}

Now let's see if the data has persisted:

`kubectl exec mysql-ephemeral -- mysql -e 'show databases;'`{{execute}}

`kubectl exec mysql-persistent -- mysql -e 'show databases;'`{{execute}}

As you can see, the database was lost in the mysql ephemeral pod but still exists in the mysql persisted one and we can find that the data is there as well:

`kubectl exec mysql-persistent -- mysql -e 'use shop; select * from FRUIT;'`{{execute}}

Using persistent storage provisioned by StorageOS makes your data safe between pod restarts, even if the pod starts in a different node!

Thank you for completing this demo!