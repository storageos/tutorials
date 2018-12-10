if ssh root@host01 'ls /opt/bootstrap.sh'; then echo "bootstrap.sh present";else echo "/opt/bootstrap.sh not avaliable on host01"; fi
if ssh root@host01 '/opt/bootstrap.sh'; then echo "Bootstrap complete"; fi
scp -p ~/.ssh/id_rsa root@host01:/root/.ssh
