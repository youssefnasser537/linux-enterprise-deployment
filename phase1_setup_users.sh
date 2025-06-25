#!/bin/bash

# Phase 1: System Preparation and User Environment

sudo hostnamectl set-hostname intranet.technova.local
#Set a static IP
sudo nmcli con mod ens33 ipv4.addresses 192.168.60.150/24
sudo nmcli con mod ens33 ipv4.gateway 192.168.60.2
sudo nmcli con mod ens33 ipv4.dns 8.8.8.8
sudo nmcli con mod ens33 ipv4.method manual
sudo nmcli con up ens33
# Create groups
for group in dev_team hr_team it_team sales_team; do
    sudo groupadd $group
done

# Create users and assign them to their groups
sudo useradd -s /bin/bash -G dev_team alice
sudo useradd -s /bin/bash -G hr_team bob
sudo useradd -s /bin/bash -G it_team carol
sudo useradd -s /bin/bash -G sales_team dave
sudo useradd -s /bin/bash -G dev_team erin
sudo useradd -s /bin/bash -G it_team frank

# Set passwords for users
echo "alice:Password123" | sudo chpasswd
echo "bob:Password123" | sudo chpasswd
echo "carol:Password123" | sudo chpasswd
echo "dave:Password123" | sudo chpasswd
echo "erin:Password123" | sudo chpasswd
echo "frank:Password123" | sudo chpasswd

# Force users to change passwords on first login
sudo chage -d 0 alice
sudo chage -d 0 bob
sudo chage -d 0 carol
sudo chage -d 0 dave
sudo chage -d 0 erin
sudo chage -d 0 frank

echo "finished successfuly, check users."
