#!/bin/bash

USERID=$(id -u)

if [[ $USERID -ne 0 ]]
then
    echo "you are not root user, please proceed with root user
    exit 1
else 
    echo "root user, please proceed"
fi

yum install git -y