#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx -y
systemctl restart nginx