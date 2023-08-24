echo -e "\e[34m ***********************Instalation starting ********************\e[0m"

echo -e "\e[31m  Install Python 3.6 \e[0m"
yum install python36 gcc python3-devel -y

useradd roboshop

rm -rf /app
mkdir /app 

echo -e "\e[32m Download the application code \e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip 

cd /app 

echo -e "\e[33m Unzipping the application code \e[0m"
unzip /tmp/payment.zip

cd /app

echo -e "\e[33m download the dependencies. \e[0m"
pip3.6 install -r requirements.txt

cp /home/centos/learn-shell/payment.service  /etc/systemd/system/payment.service

systemctl daemon-reload
systemctl enable payment 
systemctl start payment


