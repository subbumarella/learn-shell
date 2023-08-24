echo -e "\e[34m ***********************Instalation starting ********************\e[0m"
echo -e "\e[31m Install GoLang \e[0m"

yum install golang -y

useradd roboshop

rm -rf /app
mkdir /app 

echo -e "\e[32m Download the application code to created app directory. \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip 

cd /app 

echo -e "\e[33m unzipping \e[0m"
unzip /tmp/dispatch.zip

cd /app 
go mod init dispatch
go get 
go build

cp /home/centos/learn-shell/dispatch.service /etc/systemd/system/dispatch.service

systemctl daemon-reload
systemctl enable dispatch 
systemctl start dispatch




