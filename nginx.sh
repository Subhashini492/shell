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

sudo apt update 
validate $? "update"

sudo apt install nginx
validate $? "install nginx"

sudo systemctl start nginx
validate $? "start nginx"

sudo systemctl enable nginx
validate $? "enable  nginx"

sudo systemctl status nginx
validate $? "status nginx"
