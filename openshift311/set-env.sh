~/.launch.sh

export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos

while ! oc get nodes --no-headers | grep -q "Ready"; do
    printf "Waiting for OpenShift to bootstrap\n"
    sleep 5;
done
