#!/bin/bash
sudo apt list --installed | grep $1
if [ $? -eq 0 ];
then
    echo "$1 installed"
else
    echo "$1 not installed"
fi
