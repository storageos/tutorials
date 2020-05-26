echo "Starting the environment"
launch.sh

echo "Refreshing dns"
kubectl -n kube-system delete pod -l k8s-app=kube-dns &>/dev/null
