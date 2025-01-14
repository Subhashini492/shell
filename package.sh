#!/bin/bash
if [ $yum list installed | grep package_name ];
then
    echo " git is installed "

else 
    echo " git is not installed "
    exit 1
fi