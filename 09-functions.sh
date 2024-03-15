#!/bin/bash

USERID=$(id -u)

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
yum install mysql -y  
VALIDATE $? "Installing Mysql"

yum install postfix -y
VALIDATE $? "Installing postfix"