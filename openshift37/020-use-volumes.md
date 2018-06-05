## Create Persistent Volume Claim

`oc create -f pvc.yaml`{{execute}}

List volumes:
`oc get pv,pvc`{{execute}}

List volumes with StorageOS cli:
`storageos --host 127.0.0.1 -u $STORAGEOS_USER -p $STORAGEOS_PASSWORD volume ls`{{execute}}

See the status of the volume with oc cli and verify the volume is successfully allocated. 

`oc describe pvc`{{execute}}

