## Create Persistent Volume Claim

Change directories
`cd ~`{{execute}}

Then create a PersistentVolumeClaim (PVC)
`oc create -f pvc.yaml`{{execute}}

Creating a PVC also causes a PersistentVolume to be created
`oc get pv,pvc`{{execute}}

The PV is provisioned by StorageOS and can be viewed with the StorageOS CLI 
`storageos volume ls`{{execute}}

See the status of the volume with the oc cli and verify the volume has been successfully provisioned.
`oc describe pvc`{{execute}}

