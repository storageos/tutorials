launch.sh
curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.2.2/storageos_linux_amd64 && chmod +x storageos && sudo mv storageos /usr/local/bin/
# Use environment variables
export STORAGEOS_USERNAME=storageos STORAGEOS_PASSWORD=storageos

# Access StorageOS running on a remote host by providing the IP address
export STORAGEOS_HOST=[[HOST2_IP]]