echo -e "\e[34m ***********************Instalation starting ********************\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[32m Installing  NodeJS  \e[0m"
yum install nodejs -y  

echo -e "\e[33m Adding Roboshop  \e[0m"
useradd roboshop 

rm -rf /app
mkdir /app 

echo -e "\e[34m Download the application code to created app directory.  \e[0m"
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip   

echo -e "\e[31m Changing directory  \e[0m"
cd /app

echo -e "\e[33m Unziping Code  \e[0m"
unzip /tmp/user.zip 

echo -e "\e[31m Changing directory  \e[0m"
cd /app

echo -e "\e[34m Installing npm  \e[0m"
npm install 

echo -e "\e[35m Setup SystemD User Service \e[0m"
cp /home/centos/learn-shell/user.conf /etc/systemd/system/user.service

systemctl daemon-reload
systemctl enable user 
systemctl start user

echo -e "\e[31m Loading Schema and  Install mongodb-client .\e[0m"
cp /home/centos/learn-shell/mongodb.repo /etc/yum.repos.d/mongo.repo



