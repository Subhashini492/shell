#!/bin/bash

id=$(yum list installed | grep package_name)
if [ $? -eq 0 ]
then
    echo " git installed skipped installed "

else 
    echo " sudo git installed "
    exit 1
fi