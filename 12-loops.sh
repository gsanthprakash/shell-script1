#!/bin/bash

R="\e[32m"
G="\e[33m"
N="\e[0m"

SCRIPT_NAME=$0
DATE=(date %d)
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

USERID=$(id -u)
if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR: please proceed with root user $N"
    exit 1
else
    echo - e "$G you are root user"
fi


# all arguments are in $@ 
for i in $@
do 
    yum install $i &>>$LOGFILE
done