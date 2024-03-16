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
DISK_USAGE_THRESHOLD=0
message=""

#IFS= means internal feild seperator is space.
while IFS= read line
do 
   usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   partition=$(echo $line | awk '{print $1}')
   # now you need to check wheather it is more than threshold or not.

   if [[ $usage -gt $DISK_USAGE_THRESHOLD ]];
   then
   message+="HIGH DISK USAGE ON $partition: $usage%\n"
   fi

done <<< $DISK_USAGE

echo -e "Message:\n$message"
