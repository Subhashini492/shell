#!/bin/bash
echo "welcome to the game"
read -p "please enter user_name:" user
if [ $user -eq "subhashini" ];
then
    
else
    echo "please enter valid user name"
    exit 1
fi
read -p "please enter password:" password
if [ $password -eq "subbu@123" ];
then
else 
    echo "please enter correct password"
    exit 1
fi

echo "this is your user_name :$user  & password :$password"

