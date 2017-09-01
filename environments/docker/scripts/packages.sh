DEV_PACKAGES="
git
build-essential
curl
emacs24-nox
htop
nmon
slurm
tcpdump
unzip
vim
"

ESSENTIAL_PACKAGES="
ntp
nfs-common
"

sudo apt-get update
sudo apt-get -y install $ESSENTIAL_PACKAGES $DEV_PACKAGES
