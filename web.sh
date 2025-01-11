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
apt install nginx -Y &>>/tmp/$0
validate $? "install nginx"

systemctl start nginx &>>/tmp/$0
validate $? "start nginx"

systemctl enable nginx &>>/tmp/$0
validate $? "enable nginx"

rm -rf /var/www/html/* &>>/tmp/$0
validate $? "defult html files deleted"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>>/tmp/$0
validate $? "downloading artifact in tmp folder"

apt install unzip -y &>>/tmp/$0
validate $? "installed unzip"

unzip /tmp/web.zip -d /var/www/html/* &>>/tmp/$0
validate $? "unzipping web"

systemctl restart nginx &>>/tmp/$0
validate $? "restarting nginx"











 