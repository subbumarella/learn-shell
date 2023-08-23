echo -e "\e[34m ***********************Instalation starting ********************\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[32m Installing  NodeJS  \e[0m"
yum install nodejs -y  

echo -e "\e[33m Adding Roboshop  \e[0m"
useradd roboshop 

rm -rf /app
mkdir /app 

echo -e "\e[34m Download the application code to created app directory.  \e[0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip   

echo -e "\e[31m Changing directory  \e[0m"
cd /app

echo -e "\e[33m Unziping Code  \e[0m"
unzip /tmp/cart.zip 

echo -e "\e[31m Changing directory  \e[0m"
cd /app

echo -e "\e[34m Installing npm  \e[0m"
npm install 

echo -e "\e[35m Setup SystemD cart Service \e[0m"
cp /home/centos/learn-shell/cart.service /etc/systemd/system/cart.service

systemctl daemon-reload
systemctl enable cart 
systemctl start cart



