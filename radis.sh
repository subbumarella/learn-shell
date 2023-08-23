echo -e "\e[34m ***********************Instalation starting ********************\e[0m"

echo -e "\e[31m Install Radis \e[0m"

yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[32m Enable  Radis \e[0m"
yum module enable redis:remi-6.2 -y

echo -e "\e[33m Instll Radis \e[0m"
yum install redis -y 

echo -e "\e[33m Removing 127.0.0.0   \e[0m"
sed -i 's/127.0.0.1/0.0.0.0/'  /etc/redis.conf /etc/redis/redis.conf

systemctl enable redis 
systemctl start redis 