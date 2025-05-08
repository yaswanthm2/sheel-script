#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[30"

SERVER=$@
INSTANCE_TYPE=
SECURITY_GRUOP_ID=


for i in $SERVER
  do 

if [[ $i == "mongodb" || $i == "mysql" ]]
  then 
     INSTANCE_TYPE=t3.micro
  else
     INSTANCE_TYPE=t2.micro
fi

echo -e  " server name: $G $i $N "
echo " instance type: $G $INSTANCE_TYPE $N "
  done