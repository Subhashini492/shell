#!/bin/bash


for packages in $#
do
    sudo apt list --installed | grep $packages
    if [ $? -eq 0 ];
    then
        echo "$packages installed"
    else
        echo "$packages not installed"
    fi
done


