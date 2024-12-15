#!/bin/bash

ID=$(id -u)#root user decleration

TIMESTAMP=$(date +%F-%H)

LOG_FILE="/tmp/$0-$TIMESTAMP"

validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation got failed"
        exit 1
    else
        echo "$2 installation is successfull"
    fi

}

if [ $ID -ne 0 ]
then
     echo "error : you are not a root user"
     exit 1
else 
     echo "you are a root user"
fi

yum install mysql -y &>>$LOG_FILE

validate $? "mysql"

yum install git  -y &>>$LOG_FILE

validate $? "git"



# yum install git -y

# if [ $? -ne 0 ]
# then
#     echo "git installation got failed"
#     exit 1
# else
#     echo "git  installation is successfull"
# fi

