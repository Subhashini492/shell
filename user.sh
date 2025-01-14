#!/bin/bash
echo "welcome to the game"
read -p "please enter user_name:" user
if [ "$user" = "subhashini" ]; then
    echo "Welcome, $user!"
else
    echo "Please enter a valid user_name"
    exit 1
fi

read -p "please enter password:" password
if [ "$password" = "subbu@123" ];
then
    echo "your good to go $password "
else 
    echo "please enter correct password"
    exit 1
fi

echo "this is your user_name :$user  & password :$password"

