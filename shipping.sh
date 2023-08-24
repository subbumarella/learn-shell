echo -e "\e[34m ***********************Instalation starting ********************\e[0m"

echo -e "\e[31m  Installing maven \e[0m"
yum install maven -y

echo -e "\e[32m  Adding user \e[0m"
useradd roboshop

rm -rf /app
mkdir /app 

echo -e "\e[33m Download the application code \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip 

cd /app 
echo -e "\e[34m  unzipping \e[0m"
unzip /tmp/shipping.zip

cd /app 

echo -e "\e[31m download the dependencies & build the application \e[0m"
mvn clean package 

echo -e "\e[32m download the dependencies & build the application \e[0m"
mv target/shipping-1.0.jar shipping.jar 

cp /home/centos/learn-shell/shipping.service  /etc/systemd/system/shipping.service

systemctl daemon-reload
systemctl enable shipping 
systemctl start shipping

echo -e "\e[34m install mysql client \e[0m"
yum install mysql -y 

echo -e "\e[32m Load Schema \e[0m"
mysql -h mysql-dev.roboshopmarket.store -uroot -pRoboShop@1 < /app/schema/shipping.sql 


systemctl restart shipping





