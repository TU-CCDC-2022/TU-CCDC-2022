#! /bin/bash

apt=`which apt`
yum=`which yum` 

mkdir -p /run/usys

cp /etc/ssh/ssh_config /run/usys/ssh_config
cp /etc/ssh/sshd_config /run/usys/sshd_config
cp /etc/passwd /run/usys/passwd
cp /etc/sudoers /run/usys/sudoers
cp ~/.bash_history /run/usys/.bash_history
cp ~/.bashrc /run/usys/.bashrc
cp ~/.profile /run/usys/.profile
cp /etc/security/pwquality.conf /run/usys/pwquality.conf
cp /etc/login.defs /run/usys/login.defs
cp /etc/sysctl.conf /run/usys/sysctl.conf
cp /etc/default/useradd /run/usys/useradd
cp /var/spool/cron/crontabs/root /run/usys/root1crontab
cp /var/spool/cron/root /run/usys/root2crontab
cp -r /var/www/html /run/usys/html

# Processes

cp `which ps` /run/usys/ps
cp `which ss` /run/usys/ss
cp `which netstat` /run/usys/netstat
cp `which lsof` /run/usys/lsof
cp `which lsmod` /run/usys/lsmod
cp `which chkconfig` /run/usys/chkconfig
cp `which crontab` /run/usys/crontab
cp `which last` /run/usys/last
cp `which top` /run/usys/top
cp `which w` /run/usys/w
cp `which ls` /run/usys/ls
cp `which kill` /run/usys/kill0
cp `which crontab` /run/usys/

# IPFS Implementation

# Soon...

if [ -f $apt ]; then
apt install git -y
elif [ -f $yum ]; then
yum install git -y
fi

git init /run/usys