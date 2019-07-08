
function ssh_check {
    if ssh root@$HOST 'ls /' &> /dev/null; then
        echo "$HOST is up"
        return 0
    else
        echo "$HOST is not up"
        return 1
    fi
}

CLUSTER_ID=$(storageos cluster create)
HOST_ARRAY=(host01 host02 host03)

for HOST in ${HOST_ARRAY[@]}; do

    echo "Checking $HOST";

    until ssh_check "$HOST"; do

        echo "SSH check failed on $HOST. Sleeping 5";
        sleep 5;

    done

    # When ssh_check returns 0 then try to start the docker container
    if ssh root@"$HOST" "docker run -d --name storageos -e DISABLE_TELEMETRY=true                   \
        -e HOSTNAME="$HOST" -e ADVERTISE_IP=$(grep -m 1 "172.* $HOST" /etc/hosts | cut -d " " -f1 ) \
        -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN                  \
        --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared                         \
        -v/run/docker/plugins:/run/docker/plugins -v /sys:/sys storageos/node:1.3.0                 \
        server"; then

        # On success print success out to console
        echo "Container started on $HOST";
    fi
done
