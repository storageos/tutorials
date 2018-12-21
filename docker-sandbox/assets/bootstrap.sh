
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
HOST01_IP=$(awk -F[" "] '/172.* host01/{print $1}' /etc/hosts)


while [ -n "$HOST_ARRAY" ]; do
    for HOST in ${HOST_ARRAY[@]}; do

        echo "Checking $HOST";

        if ssh_check "$HOST"; then

            echo "SSH check passed. Starting container on $HOST";

            # If the ssh_check returns 0 then try and start the docker container
            if ssh root@"$HOST" "docker run -d --name storageos -e DISABLE_TELEMETRY=true                   \
                -e HOSTNAME="$HOST" -e ADVERTISE_IP=$(grep -m 1 "172.* $HOST" /etc/hosts | cut -d " " -f1 ) \
                -e JOIN=$CLUSTER_ID --net=host --pid=host --privileged --cap-add SYS_ADMIN                  \
                --device /dev/fuse -v /var/lib/storageos:/var/lib/storageos:rshared                         \
                -v/run/docker/plugins:/run/docker/plugins -v /sys:/sys storageos/node:1.0.2                 \
                server"; then

                # If the docker container starts successfully then remove that host
                # from the array
                HOST_ARRAY=( "${HOST_ARRAY/$HOST}" )
                echo "Container started on $HOST";
            fi
        fi
    done
done
