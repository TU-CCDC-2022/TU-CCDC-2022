#! /bin/bash

if  [ $UID -ne 0 ]
then
    echo "[ERROR] You must run this script as root!"
    exit
fi

touch -r `which rm` /usr/bin/proclator

echo "ss = " $(echo `which ss`  | md5sum) >> /usr/bin/proclator
echo "netstat = " $(echo `which netstat`  | md5sum) >> /usr/bin/proclator
echo "ssh = " $(echo `which ssh`  | md5sum) >> /usr/bin/proclator
echo "iptables = " $(echo `which iptables`  | md5sum) >> /usr/bin/proclator
echo "ps = " $(echo `which ps`  | md5sum) >> /usr/bin/proclator
echo "top = " $(echo `which top`  | md5sum) >> /usr/bin/proclator
echo "sudo = " $(echo `which sudo`  | md5sum) >> /usr/bin/proclator
echo "service = " $(echo `which service`  | md5sum) >> /usr/bin/proclator
echo "apt = " $(echo `which apt`  | md5sum) >> /usr/bin/proclator
echo "top = " $(echo `which top`  | md5sum) >> /usr/bin/proclator
echo "ls = " $(echo `which ls`  | md5sum) >> /usr/bin/proclator
echo "cd = " $(echo `which cd`  | md5sum) >> /usr/bin/proclator

chattr +i /usr/bin/proclator