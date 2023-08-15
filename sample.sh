#!/bin/bash
echo -e "\e[31m Installing nginx \e[0m"
yum install nginx -y 

echo -e "\e[32m Removing default pages \e[0m"
rm -rf /usr/share/nginx/html/* 

echo -e "\e[32m Installing frontend zip  \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

cd /usr/share/nginx/html 
echo -e "\e[33m Unzip the file \e[0m"
unzip /tmp/frontend.zip

# vim /etc/nginx/default.d/roboshop.conf 
echo -e "\e[34m restarting the nginx \e[0m"
systemctl enable nginx 

systemctl restart nginx 
