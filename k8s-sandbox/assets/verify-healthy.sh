echo 'Waiting for StorageOS to initialise... this will take a minute.'
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://[[HOST2_IP]]:5705/v1/health)" != "200" ]]; do
  printf '.'
  sleep 5;
done
echo ''
echo 'StorageOS is ready!'
