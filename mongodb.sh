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
rm -rf /etc/yum.repos.d/mongo*
cp /home/ec2-user/shell/mongo.repo /etc/yum.repos.d/mongo.repo
validate $? " coping mongo.repo "

sudo yum install mongodb-org -y
validate $? " installing mongodb-org "

sudo systemctl enable mongod
validate $? " enableing mongodb "

sudo systemctl start mongod
validate $? " starting mongodb "

sed 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
validate $? " replacing 127.0.0.1 to 0.0.0.0 "

sudo systemctl restart mongod
validate $? " restarting mongodb "
