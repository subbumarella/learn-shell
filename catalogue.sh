echo -e "\e[34m ***********************Instalation starting ********************\e[0m"

echo -e "\e[31m Setup NodeJS  \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  

echo -e "\e[32m Installing  NodeJS  \e[0m"
yum install nodejs -y  

echo -e "\e[33m Adding Roboshop  \e[0m"
useradd roboshop 

rm -rf /app
mkdir /app 

echo -e "\e[34m Download the application code to created app directory.  \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip   

echo -e "\e[31m Changing directory  \e[0m"
cd /app

echo -e "\e[33m Unziping Code  \e[0m"
unzip /tmp/catalogue.zip 

echo -e "\e[31m Changing directory  \e[0m"
cd /app

echo -e "\e[34m Installing npm  \e[0m"
npm install 

echo -e "\e[35m Setup SystemD Catalogue Service \e[0m"
cp /home/centos/learn-shell/catalogue.conf /etc/systemd/system/catalogue.service

systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue

echo -e "\e[31m Loading Schema and  Install mongodb-client .\e[0m"
cp /home/centos/learn-shell/mongodb.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[312 Install mongodb-client \e[0m"
yum install mongodb-org-shell -y

echo -e "\e[352 Load schema \e[0m"
mongo --host mongodb-dev.roboshopmarket.store </app/schema/catalogue.js











