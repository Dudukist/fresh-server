#!/bin/bash

#apt update -y
#apt upgrade -y
#timedatectl set-timezone Asia/Tehran
apt install curl socat
echo "127.0.0.1 `hostname`"  >> /etc/hosts
echo "127.0.0.43 api.telegram.org"  >> /etc/hosts

exit 0

