#!/bin/bash

SOURCE_DIR="/tmp/Shellscript-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

if [ ! -d $SOURCE_DIR] # -d basically checks directpry there or not 
then 
    echo -e "$R ....$SOURCE_DIR does not exist $N"
fi

FILES_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line  #Internal field seperator
do
   echo "deleting files:$line"
    rm -rf $line   
done <<< $FILES_DELETE

