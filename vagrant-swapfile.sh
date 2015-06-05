#!/bin/sh

#create the swap space 1GB
echo "Creating 1GB swap space in /swapfile..."
fallocate -l 1G /swapfile
ls -lh /swapfile

#secure the swapfile
echo "Securing the swapfile..."
chown root:root /swapfile
chmod 0600 /swapfile
ls -lh /swapfile

#turn the swapfile on
echo "Turning the swapfile on..."
mkswap /swapfile
swapon /swapfile


echo "Verifying..."
swapon -s
grep -i --color swap /proc/meminfo

echo "Adding swap entry to /etc/fstab"
echo "\n/swapfile none            swap    sw              0       0" >> /etc/fstab

echo "Result: "
cat /etc/fstab

echo " ****** We are done !!! ********"