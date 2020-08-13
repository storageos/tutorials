1. Delete the Pod
`kubectl -n prod delete pod d1`{{execute}}

Wait until the Pod is deleted.

2. Recreate Pod to mount the Volume
```
kubectl create -f- <<END
apiVersion: v1
kind: Pod
metadata:
  name: d2
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

3. Check content
`kubectl -n prod exec d2 -- cat /mnt/hello`{{execute}}

The data is persisted across container restarts and can be claimed by
applications.
