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

sudo apt update &>>/tmp/$0
validate $? "update"

sudo apt install nginx &>>/tmp/$0
validate $? "install nginx"

sudo systemctl start nginx &>>/tmp/$0
validate $? "start nginx"

sudo systemctl enable nginx &>>/tmp/$0
validate $? "enable  nginx"

sudo systemctl status nginx &>>/tmp/$0
validate $? "status nginx"
