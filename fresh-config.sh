#!/bin/bash

apt update -y
apt upgrade -y
apt install curl socat vnstat nload 
timedatectl set-timezone Asia/Tehran
apt install curl socat
echo "127.0.0.1 `hostname`"  >> /etc/hosts
echo "127.0.0.43 api.telegram.org"  >> /etc/hosts
-----------------------------
# change ssh login permission
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
service ssh reload
-----------------------------



