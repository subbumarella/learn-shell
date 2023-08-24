
echo -e "\e[34m ***********************Instalation starting ********************\e[0m"
echo -e "\e[31m  Configure YUM Repos \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

echo -e "\e[32m  Configure YUM Repos  for RabbitMQ.\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

echo -e "\e[33m  Install RabbitMQ.\e[0m"
yum install rabbitmq-server -y 

systemctl enable rabbitmq-server 
systemctl start rabbitmq-server

rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
