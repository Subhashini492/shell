#!/bin/bash
validate (){
    if [ $1 -eq 0 ];
    then
       echo "SUCCESS $2"
    else
       echo "FAILED $2"
       exit 1
    fi
}

sudo apt update &>>/tmp/nginx.log
validate $? "update"

sudo apt install nginx &>>/tmp/nginx.log
validate $? "install nginx"

sudo systemctl start nginx &>>/tmp/nginx.log
validate $? "start nginx"

sudo systemctl enable nginx &>>/tmp/nginx.log
validate $? "enable  nginx"

