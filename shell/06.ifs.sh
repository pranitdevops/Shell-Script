#!/bin/bash

FILE=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

if [ ! -f $FILE] # -d basically checks directpry there or not 
then 
    echo -e "$R ....$FILE does not exist $N"
fi

while IFS=":" read -r user_name password user_id group_id
do
    echo "username:$user_name"
    echo "user ID:$user_id"
done < $FILE