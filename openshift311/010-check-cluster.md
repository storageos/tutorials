## Create a StorageOS Cluster

To create a StorageOS cluster a StorageOSCluster resource is created.

A StorageOSCluster is a custom resource acted upon by the StorageOS operator.
When the StorageOS operator detects a StorageOSCluster resource it will create
a StorageOS cluster based on the StorageOSCluster resource.

``
oc create -f - <<END
apiVersion: "storageos.com/v1"
kind: StorageOSCluster
metadata:
  name: "example-storageos"
spec:
  secretRefName: "storageos-api"
  secretRefNamespace: "default"
  images:
    nodeContainer: "storageos/node:1.2.0"
  disableTelemetry: true
END
``{{execute}}

Verify that the pod enters a running state
`oc get pods -n storageos -w`{{execute}}

## Check StorageOS status

There are other ways to check the health of the StorageOS cluster 

1. Using StorageOS CLI: ``storageos node ls``{{execute}}

2. Check the health REST API endpoint directly by: ``curl 127.0.0.1:5706/health``{{execute}}

3. Use the StorageOS Web UI


## Web UI

StorageOS container spins up a lightweight UI from which you can see and control volumes, nodes, etc.

https://[[HOST_SUBDOMAIN]]-5705-[[KATACODA_HOST]].environments.katacoda.com/

Access the StorageOS UI by clicking on the **StorageOS** tab in the console
frame of this browser window or use the hyperlink above. This will open the web
console in another tab or window of your browser.

You should see an **StorageOS login** window with **Username** and **Password** forms.

**Username:** ``storageos``{{copy}}
**Password:** ``storageos``{{copy}}

The Username and password that are created are defined by in the storageos-api
secret that was created previously.
