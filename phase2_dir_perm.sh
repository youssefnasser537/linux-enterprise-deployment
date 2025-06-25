#!/bin/bash

# Create directories
sudo mkdir -p /srv/{dev,hr,it,sales,public_temp}

# Set ownership and permissions
for dir in dev hr it sales; do
    sudo chown root:${dir}_team /srv/$dir
    sudo chmod 2770 /srv/$dir
done

# ACLs
sudo setfacl -m u:frank:rwX /srv/{dev,hr,it,sales}
sudo setfacl -m u:bob:r-- /srv/sales

# Shared public temp
sudo chmod 1777 /srv/public_temp
