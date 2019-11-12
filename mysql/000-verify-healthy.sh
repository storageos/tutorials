
while [ ! -f /opt/verify-healthy.sh ]; do
    sleep 1;
done

for i in {1..20}; do /root/verify-healthy.sh && break || sleep 1; done
