#!/bin/bash
sudo apt update
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo rm -rf /var/www/html/*
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip
cd /var/www/html
sudo apt install unzip -y
unzip /tmp/web.zip
systemctl restart nginx 