#!/bin/bash

ID=$(id -u)#root user decleration

if [ $ID -ne 0 ]
then
echo "error : you are not a root user"
exit 1
else 
echo "you are a root user"
fi

yum install mysql -y

