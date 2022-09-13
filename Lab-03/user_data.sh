#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install httpd
MACHINE_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with PrivateIP: $MACHINE_IP</h2><br>Built by Terraform" > /var/www/html/index.html
sudo systemctl restart httpd
