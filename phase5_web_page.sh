#!/bin/bash

sudo yum install  httpd
echo "<h1>Welcome to TechNova Internal Portal</h1><p>Only accessible inside the company.</p>" | sudo tee /var/www/html/index.html
sudo chcon -t httpd_sys_content_t /var/www/html/index.html
sudo systemctl enable --now httpd
