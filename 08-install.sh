#!/bin/bash

USERID=$(id-u)

if [[ $USERID -ne 0 ]]
then
    echo "your root user, please proceed
else 
    echo "you are not root user, please proceed with root user.
fi

yum install git -y