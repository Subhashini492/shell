#!/bin/bash
sudo apt list --installed | grep java
if [ $? -eq 0 ];
then
    echo "java installed"
else
    echo "java not installed"
fi