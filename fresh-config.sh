#!/bin/bash

apt update && apt upgrade -y
apt install curl socat -y
echo "127.0.0.1 `hostname`"  >> /etc/hosts
echo "127.0.0.43 api.telegram.org"  >> /etc/hosts



