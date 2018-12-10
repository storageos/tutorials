echo 'Waiting for StorageOS to initialise... this will take a minute.'
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:5705/v1/namespaces -u storageos:storageos)" != "200" ]]; do
  printf '.'
  sleep 5;
done
echo ''
echo 'StorageOS is ready on Host01!'

