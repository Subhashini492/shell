#!/bin/bash
id=$(id -u)
if [ $id -eq 0 ];
then 
    echo "you are a root user"
else 
    echo "please run the code with root user"
    exit 1
fi 

apt update
validate () {
    if [ $1 -eq 0 ];
    then 
        echo "$2 SUCCESS"
    else 
        echo "$2 FAILURE"
        exit 1
    fi
}
apt install nginx -y &>>/tmp/web.log
validate $? "install nginx"

systemctl start nginx &>>/tmp/web.log
validate $? "start nginx"

systemctl enable nginx &>>/tmp/web.log
validate $? "enable nginx"

rm -rf /var/www/html/* &>>/tmp/web.log
validate $? "defult html files deleted"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>>/tmp/web.log
validate $? "downloading artifact in tmp folder"

apt install unzip -y &>>/tmp/web.log
validate $? "installed unzip"

unzip /tmp/web.zip -d /var/www/html/* &>>/tmp/web.log
validate $? "unzipping web"

systemctl restart nginx &>>/tmp/web.log
validate $? "restarting nginx"











 