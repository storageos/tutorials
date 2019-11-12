for host in host01 host02 host03; do
    echo "Waiting for StorageOS to initialise on $host... this will take a minute."

#Use the nodes endpoint rather than health because it takes longer for nodes
#endpoint to come up and it seems to more accurately reflect when the cluster is
#ready
    while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://$host:5705/v1/nodes -u storageos:storageos)" != "200" ]]; do
      printf '.'
      sleep 5;
    done

    printf "\nStorageOS is ready on $host\n"

done