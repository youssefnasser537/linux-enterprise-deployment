#!/bin/bash


# Show logs
sudo grep "Failed password" /var/log/secure

last
who
sudo journalctl -xe
