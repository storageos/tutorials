## Install the StorageOS Operator

The StorageOS operator is an [OpenShift
Operator](https://operatorhub.io/operator/stable/storageosoperator.v1.1.0) that
is designed to help manage StorageOS installations. Using the Operator means
that a lot of the manual configuration that is required for a StorageOS
installation is no longer required.

``
git clone https://github.com/storageos/deploy.git storageos
cd storageos/openshift/deploy-storageos/cluster-operator
./deploy-operator.sh
``{{execute}}

## Verify the StorageOS Operator Installation

Verify that a StorageOS operator has been created
`oc get pods -n storageos-operator`{{execute}}

## Create a StorageOS API secret

A secret defining the StorageOS API username and password needs to be created
so OpenShift can communicate with StorageOS via the StorageOS API. The API
username and password will be used to create the default StorageOS account.
These account details will be used to log in to the StorageOS UI and can be
used with the StorageOS CLI.

``
oc create -f - <<END
apiVersion: v1
kind: Secret
metadata:
  name: "storageos-api"
  namespace: "default"
  labels:
    app: "storageos"
type: "kubernetes.io/storageos"
data:
  apiUsername: c3RvcmFnZW9z
  apiPassword: c3RvcmFnZW9z
END
``{{execute}}

## Create Security Context Constraints (SCC) for StorageOS

The StorageOS service account needs to be granted access to the privileged SCC
as it creates pods on the behalf of the user.

`oc adm policy add-scc-to-user privileged system:serviceaccount:storageos:storageos-daemonset-sa`{{execute}}

