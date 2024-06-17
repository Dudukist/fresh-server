#!/bin/bash

apt update -y
apt upgrade -y
apt install curl socat vnstat nload 
timedatectl set-timezone Asia/Tehran
apt install curl socat
echo "127.0.0.1 `hostname`"  >> /etc/hosts
echo "127.0.0.43 api.telegram.org"  >> /etc/hosts
apt install sshpass
-----------------------------
# change ssh login permission
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
service ssh reload
-----------------------------

# Configuration
SOURCE_FILE="/etc/x-ui/x-ui.db"  # Path to the file you want to back up
DEST_USER="root"                    # Username for the destination server
DEST_HOST="fsn.dudukman.tech"      # Hostname or IP address of the destination server
DEST_DIR="/root/x-ui-shop.db"    # Destination directory on the remote server
SSH_PASSWORD="C!sco1992"

# Log file
LOG_FILE="/root/backup.log"

# Function to perform the backup
perform_backup() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - Starting backup of $SOURCE_FILE to $DEST_USER@$DEST_HOST:$DEST_DIR" >> $LOG_FILE

  # Perform the backup using scp
  sshpass -p $SSH_PASSWORD scp $SOURCE_FILE $DEST_USER@$DEST_HOST:$DEST_DIR

  if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup successful" >> $LOG_FILE
  else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup failed" >> $LOG_FILE
  fi
}

# Execute the backup function
perform_backup

////////////////////////////////////////////////////////////////////////////



