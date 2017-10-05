export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos STORAGEOS_HOST=localhost
for i in {1..20}; do /opt/verify-healthy.sh && break || sleep 1; done
