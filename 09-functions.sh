#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ...$R FAILURE $N"
        exit 1
    else
        echo "$2 ...$G SUCCESS $N"
    fi
}

USERID=(id u)

if [ $USERID -ne 0 ]
then    
    echo "ERROR: Not root user"
    exit 1
else
    echo "you are root user"
fi

# it is our responsibility again installation is success or not.
yum install mysql -y  &>>$LOGFILE
VALIDATE $? "Installing Mysql"

yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"