#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR :: No sudo privelages so you cannot proceed"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Error while installing mysql"
    exit 1
else
    echo "Installing Mysql"
fi

dnf install git -y

if [ $? -ne 0 ] 
then
    echo "Error while installing git"
    exit 1
else
    echo "Installing Git"
fi