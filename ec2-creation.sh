#!/bin/bash

R="\e[31m"    #it will give text red color 
G="\e[32m"    #it will give text green color 
N="\e[0m"     #it will give normal color to text 

DATE=$(date +%F)
SCRIPTFILE_NAME=$0
LOG_FILE=/tmp/$SCRIPTFILE_NAME-$DATE.log

INSATNCES_NAMES=("mongodb" "cart" "app" "mysql")

for i in ${INSATNCES_NAMES[@]}
   do 
     echo -e " $G names of instances : $i $N "
    
    done

