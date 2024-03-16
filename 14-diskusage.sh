#!/bin/bash

DATE=$(date +%F)

#colors
#validations
# logs redirdctions.

R="\e[31m"
G="\e[32m"
N="\e[0m"

USERID=$(id -u)
LOGSDIR=/home/centos/shell-script-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

DISK_USAGE=$(df -hT | grep xfs)
DISK_USAGE_THRESHOLD=1% 

#IFS= means internal feild seperator is space.
while IFS= read line
do 
    echo "output: $line"
done >>> $DISK_USAGE
