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

yum module disable nodejs -y
validate $? " disabiling nodejs "

yum module enable nodejs:18 -y
validate $? " enableing nodeis "

yum install nodejs -y
validate $? " installing nodejs "

useradd roboshop
validate $? " adding roboshopuser "

mkdir /app
validate $? " creating app directory "

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
validate $? " downloading catalogue artificate "

unzip /tmp/catalogue.zip -d /app
validate $? " unzipping catalogue"

cd /app
validate $? " changing into app directory "

npm install 
validate $? " npm install "

cp catalogue.service /etc/systemd/system/catalogue.service
validate $? " copying catalogue service "

systemctl daemon-reload
validate $? " daemon reload "

systemctl enable catalogue
validate $? " enabling catalogue "

systemctl start catalogue
validate $? " starting catalogue "

cp mongo.repo /etc/yum.repos.d/mongo.repo
validate $? " copying mongo.repo "

yum install mongodb-org-shell -y
validate $? " installing mongodb-org-shell "

mongo --host  13.201.166.5 </app/schema/catalogue.js
validate $? " loading catalogue schema "








