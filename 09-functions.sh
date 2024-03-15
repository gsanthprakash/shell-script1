#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [$1 -ne 0]
    then 
        echo "Installation ...FAILURE"
        exit 1
    else
        echo "Installation ...SUCCESS"
    fi
}

# it is our responsibility again installation is success or not.
yum install mysql -y 
VALIDATE $?

yum install pstfix -y
VALIDATE $?