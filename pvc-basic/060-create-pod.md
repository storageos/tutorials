Once PVCs are provisioned, Pods can use them to store data persisted by
StorageOS.

1. Create Pod using PVC

    ```
   kubectl create -f- <<END
   apiVersion: v1
   kind: Pod
   metadata:
     name: d1
     namespace: prod
     labels:
       app: debian
   spec:
     containers:
       - name: debian
         image: debian:9-slim
         command: ["/bin/sleep"]
         args: [ "3600" ]
         volumeMounts:
           - mountPath: /mnt
             name: v1
     volumes:
       - name: v1
         persistentVolumeClaim:
           claimName: pvc-1
   END
    ``` {{execute}}

    Wait for the Pod to be ready

    `kubectl -n prod get pod -w`{{execute}}

1. Exec into the Pod

    `kubectl -n prod exec -it d1 -- /bin/bash`{{execute}}

1. Check the FileSystem in the Pod

    `df -h /mnt`{{execute}}

1. Create file in the StorageOS Volume

    `echo 'Hello world' > /mnt/hello`{{execute}}

1. Exit the Pod

    `exit`{{execute}}
