#!/bin/bash


ID=$(id -u)#root user decleration

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

TIMESTAMP=$(date +%F-%H)

LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "Script is executing at $TIMESTAMP" &>> $LOG_FILE 

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ........ $R Failed $N"
        exit 1
    else
        echo -e "$2 ...........$G success $N"
    fi

}

if [ $ID -ne 0 ]
then
     echo -e " $R error : you are not a root user $N"
     exit 1
else 
     echo  -e " $G you are a root user $N"
fi

for package in $@ # all aruguements in terminal
do 
   yum list installed $package &>> $LOG_FILE  #installed or not basically checking
   if [ $? -ne 0 ]
   then
         yum install $package -y &>> $LOG_FILE
         validate $? "instalation of $package"
   else
          echo -e " $package is already installed ----- $Y skipping $N"

    fi
done  