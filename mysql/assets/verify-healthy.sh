#!/bin/bash

echo "Setting up the environment, please wait until you see the prompt."

declare -A hosts=( ["host01"]="node01" ["host02"]="node02" ["host03"]="node03")

for host in ${!hosts[@]}; do
    echo "Waiting for StorageOS to initialise on $host... this will take a minute."

#Use the nodes endpoint rather than health because it takes longer for nodes
#endpoint to come up and it seems to more accurately reflect when the cluster is
#ready
    while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://${hosts[$host]}:5705/v1/nodes -u storageos:storageos)" != "200" ]]; do
      printf '.'
      sleep 5;
    done

    printf "\nStorageOS is ready on $host\n"

done
