#!/bin/bash
id=$(id -u)
if [ $id -eq 0 ];
then 
    echo "you are a root user"
else 
    echo "please run the code with root user"
    exit 1
fi 

validate () {
    if [ $1 -eq 0 ];
    then 
        echo "$2 SUCCESS"
    else 
        echo "$2 FAILURE"
        exit 1
    fi
}
sudo yum install nginx -y &>>/tmp/web.log
validate $? "install nginx"

sudo systemctl start nginx &>>/tmp/web.log 
validate $? "start nginx"

sudo systemctl enable nginx &>>/tmp/web.log  
validate $? "enable nginx"

sudo rm -rf /usr/share/nginx/html/* &>>/tmp/web.log 
validate $? "defult html files deleted"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>>/tmp/web.log 
validate $? "downloading artifact in tmp folder"

sudo yum install unzip -y &>>/tmp/web.log
validate $? "installed unzip"

unzip /tmp/web.zip -d /usr/share/nginx/html &>>/tmp/web.log
validate $? "unzipping web"

sudo systemctl restart nginx &>>/tmp/web.log 
validate $? "restarting nginx"











 