A production installation would use a Statefulset to deploy a MySQL, you can
see an example https://github.com/storageos/use-cases/tree/master/mysql. For
demonstration purposes, we are using a PVC and a Pod.

1. Create PersistentVolumeClaim

    `kubectl create -f storageos-pvc.yaml`{{execute}}

    > Note the PVC definition has the label `storageos.com/replicas: 1`
    enforcing one synchronous replica of the volume in addition to the
    Primary

1. Create Pod

    `kubectl create -f mysql-pod1.yaml`{{execute}}

1. Check the PVC, PV and StorageOS Volume

    `storageos get volume`{{execute}}

    `kubectl get pvc,pv`{{execute}}

    > StorageOS dynamically provisions the PV when the PVC is created

1. Check the Pod status

    `kubectl get pods -w`{{execute}}

    > The above command watches the pod created in the default namespace. Press
    > `Ctrl+C` to continue once the pods are up.
