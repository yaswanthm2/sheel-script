#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

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

echo -e  " Server name: $G $i $N "
echo -e " Instance type: $G $INSTANCE_TYPE $N "
  done