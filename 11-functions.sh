#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ....FAILURE"
        exit 1
    else
        echo "$2 .... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR :: You must have sudo access to install the packages"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE($? "Installing Mysql")
else
    echo "Already mysql is installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE($? "Installing Git")
else
    echo "Already Git is installed"
fi
