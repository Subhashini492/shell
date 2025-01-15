#!/bin/bash

PACKAGE_NAME="git"

if yum list installed "$PACKAGE_NAME" &>/dev/null; 
then
    echo "Package '$PACKAGE_NAME' is already installed. Skipping installation."
else
    echo "Package '$PACKAGE_NAME' is not installed. Attempting to install it..."
    sudo yum install -y "$PACKAGE_NAME"

    if [ $? -eq 0 ]; 
    then
        echo "Package '$PACKAGE_NAME' installed successfully."
    else
        echo "Failed to install package '$PACKAGE_NAME'."
        exit 1
    fi
fi
