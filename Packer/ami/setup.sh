#!/bin/bash
set -x
sudo apt-get update
sudo apt-get install nginx -y

echo 'WordPress' |sudo tee /var/www/html/index.html

sudo systemctl enable nginx
