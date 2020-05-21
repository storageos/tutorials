
StorageOS uses etcd to store its metadata. First we will install a cluster
using the etcd operator. Which is used sole for testing purposes. Check
https://docs.storageos.com/docs/operations/external-etcd/ if you want a
production topology.


Install etcd using the shell script.

`./deploy-etcd.sh`{{execute}}

The script creates the `etcd` Namespace, deploys the etcd operator and creates
a cluster with one node only. Production clusters shall have either 3 or 5
nodes for HA and quorum.

Verify the Cluster Operator pod status

`kubectl -n etcd get pod`{{execute}}

Check the Services in the etcd namespace. We will need the etcd url to pass to
StorageOS

`kubectl -n etcd get svc`{{execute}}

The Service url we are going to use is
`http://storageos-etcd-client.etcd:2379`{{copy}}

Where `storageos-etcd-client` is the Service and `etcd` is the Namespace.
