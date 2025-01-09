#!/bin/bash
echo "it is a validation or not"
if [ $? -ne 0 ];
then
   echo "failure"
   exit 1
else
    echo "true "
fi

ls -la
if [ $? -ne 0 ];
then
   echo "failure ls -la"
   exit 1
else
    echo "true ls -la" 
fi

pwf
if [ $? -ne 0 ];
then
   echo "failure pwf"
   exit 1
else
    echo "true pwf"
fi

pwd
if [ $? -ne 0 ];
then
   echo "failure pwd"
   exit 1
else
    echo "true pwd"

fi
    