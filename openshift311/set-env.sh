export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos

SECONDS=0
while ! oc get nodes --no-headers 2> /dev/null | awk '{print $2}' | grep -qe "^Ready"; do
    printf "Waiting for OpenShift to bootstrap\n"
    sleep 5;
done

echo "OpenShift bootstrapped in $SECONDS"
