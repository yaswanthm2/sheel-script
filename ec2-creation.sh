#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

SERVER=$@
INSTANCE_TYPE=
SECURITY_GROUP_ID="sg-0f727fc59d89f7325"
IMAGE_ID="ami-0f88e80871fd81e91"


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

echo " creating instance : $i "

IP_ADDRESS=$( aws ec2 run-instances \
  --image-id $IMAGE_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name  awsdevops\
  --security-group-ids $SECURITY_GROUP_ID \
  --count 1 \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$i'}]' | jq -r '.Instances[0].PrivateIpAddress' )

Exitstatuscode=$(echo $?)
echo " Ip address of $i : $IP_ADDRESS "
echo " exit status code: $Exitstatuscode "
  done

