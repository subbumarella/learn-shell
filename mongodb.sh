echo -e "\e[31m Installing mongodb   \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[32m Installing mongodb   \e[0m"
yum install mongodb-org -y 

echo -e "\e[33m Removing 127.0.0.0   \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf  
systemctl enable mongod  
systemctl restart mongod  