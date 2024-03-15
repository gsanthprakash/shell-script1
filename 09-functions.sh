#!/bin/bash


DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ...FAILURE"
        exit 1
    else
        echo "$2 ...SUCCESS"
    fi
}

# it is our responsibility again installation is success or not.
yum install mysql -y  &>>$LOGFILE
VALIDATE $? "Installing Mysql"

yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"