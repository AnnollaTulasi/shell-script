#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER=/var/log/script-logs
LOG_FILE=$(echo $0 | cut -d "." -f1)   #gets file name and removes the  .sh part
TIMESTAMP=$(date + %Y-%m-%d_%H:%M:%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE_NAME-$TIMESTAMP.log"

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

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Mysql"
else
    echo -e "Already mysql is  $Y installed"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo -e "Already Git is  $Y installed"
fi
