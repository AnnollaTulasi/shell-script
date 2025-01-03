#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR :: You must have sudo access to install the packages"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo -e "Already mysql is  $Y installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "Already Git is  $Y installed"
fi
