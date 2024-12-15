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

if [ $? -ne 0 ]
then
    echo "mysql installation got failed"
    exit 1
else
    echo "mysql installation is successfull"
fi


yum install git -y

if [ $? -ne 0 ]
then
    echo "git installation got failed"
    exit 1
else
    echo "git  installation is successfull"
fi

