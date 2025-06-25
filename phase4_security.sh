#!/bin/bash

# Sudo for frank
echo "frank ALL=(ALL) /usr/sbin/useradd, /usr/bin/yum" | sudo tee /etc/sudoers.d/frank
sudo chmod 440 /etc/sudoers.d/frank

# SSH configuration
echo "AllowGroups it_team" | sudo tee -a /etc/ssh/sshd_config
echo "PermitRootLogin no" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# SELinux config
sudo setenforce 1
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"
sudo restorecon -Rv /var/www/html

# Firewall config
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-icmp-block-inversion
sudo firewall-cmd --reload
