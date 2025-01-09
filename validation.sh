#!/bin/bash
echo "it is a validation or not"
if [ $? -ne 0 ];
then
   echo "failure"
   exit 1
else
    echo "true"
fi

ls -la
if [ $? -ne 0 ];
then
   echo "failure"
   exit 1
else
    echo "true"
fi

pwf
if [ $? -ne 0 ];
then
   echo "failure"
   exit 1
else
    echo "true"
fi

pwd
if [ $? -ne 0 ];
then
   echo "failure"
   exit 1
else
    echo "true"

fi
    