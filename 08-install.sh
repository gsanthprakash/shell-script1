#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: you are not root user, please proceed with root user"
    exit 1
else 
    echo "root user, please proceed"
fi

# it is our responsibility again installation is success or not.
yum install mysql -y 

if [ $USERID -ne 0 ]
then
    echo "ERROR: insallation is mysql"
    exit 1
else 
    echo "installation of mysql is success"
fi

yum install pstfix -y