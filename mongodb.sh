echo -e "\e[31m Installing mongodb   \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[32m Installing mongodb   \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[33m Removing 127.0.0.0   \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>/tmp/roboshop.log
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log