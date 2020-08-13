Now delete both pods and recreate them:

`kubectl delete pod mysql-persistent`{{execute}}

`kubectl delete pod mysql-ephemeral`{{execute}}

Make sure that they are deleted:

`kubectl get pods -w`{{execute}}

And now recreate the pods:

`kubectl create -f mysql-pod1.yaml`{{execute}}

`kubectl create -f mysql-pod2.yaml`{{execute}}

Now let's see if the data has persisted:

`kubectl exec mysql-ephemeral -- mysql -c 'show databases;'`{{execute}}

`kubectl exec mysql-persisted -- mysql -c 'show databases;`{{execute}}

As you can see, the database was lost in the mysql ephemeral pod but still exists in the mysql persisted one and we can find that the data is there as well:

`kubectl exec mysql-persisted -- mysql -c 'use shop; select * from books;'`{{execute}}

Using persistent storage provisioned by StorageOS can persist data even after pod failover!

Thank you for completing this demo!