#!/bin/bash
validation () {
    if [ $1 -eq 0 ];
    then
        echo "SUCUESS $2"
    else
        echo "FAILED $2"
        exit 1
    fi
}

ls -la
validation $? "ls -la"

pwd
validation $? "pwd"

pwf
validation $? "pwf"

ls
validation $? "ls"
