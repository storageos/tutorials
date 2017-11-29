ssh root@host01 "APIADDRESS=$(echo -n "tcp:/[[HOST2_IP]]:5705" | base64); sed -i 's/REPLACE/$APIADDRESS/g' storageos-secret.yaml"
