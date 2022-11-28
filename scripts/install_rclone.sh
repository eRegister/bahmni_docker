#! /bin/bash

cat << MESSAGE1
***********************************INSTALLING RCLONE************************************
MESSAGE1

#curl https://rclone.org/install.sh | bash
apt update
apt upgrade
apt install rclone
echo "RCLONE INSTALLED SUCCESSFULLY..."

cat << MESSAGE2
***********************************CONFIGURING RCLONE************************************
MESSAGE2
mkdir -p /root/.config/rclone
cp rclone.conf /root/.config/rclone/

echo "RCLONE CONFIGURED SUCCESSFULLY.."
