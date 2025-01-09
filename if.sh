#!/bin/bash
date +%x
ID=$(id -u) 
if [ $ID -eq 0 ];
then 
    echo "you are root user . good to go , thank you"
else
    echo " you are not a root user"
    exit 1
fi
sudo apt update
echo "my name is sai charan"
echo "$0"
