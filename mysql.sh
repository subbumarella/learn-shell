echo -e "\e[34m ***********************Instalation starting ********************\e[0m"
yum module disable mysql -y 

cp /home/centos/learn-shell/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[31m Install MySQL Server \e[0m"
yum install mysql-community-server -y

echo -e "\e[32m Start MySQL Service \e[0m"
systemctl enable mysqld
systemctl start mysqld  

echo -e "\e[33m We need to change the default root password in order to start using the database \e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
