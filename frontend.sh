#!/bin/bash
echo -e "\e[34m ***********************Instalation starting ********************\e[0m"
echo -e "\e[31m Installing nginx \e[0m"
yum install nginx -y > /tmp/roboshop.log

echo -e "\e[32m Removing default pages \e[0m"
rm -rf /usr/share/nginx/html/* > /tmp/roboshop.log

echo -e "\e[32m Installing frontend zip  \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip > /tmp/roboshop.log 2> /tmp/error.log

cd /usr/share/nginx/html 
echo -e "\e[33m Unzip the file \e[0m"
unzip /tmp/frontend.zip > /tmp/roboshop.log

# vim /etc/nginx/default.d/roboshop.conf 
echo -e "\e[34m restarting the nginx \e[0m"
systemctl enable nginx > /tmp/roboshop.log

systemctl restart nginx > /tmp/roboshop.log

echo -e "\e[34m ***********************Instalation ending ********************\e[0m"
