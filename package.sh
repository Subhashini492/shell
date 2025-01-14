#!/bin/bash
if [ $installed -eq git ];
then
    echo " yum list installed | grep package_name "

else 
    echo " git is not installed "
    exit 1
fi