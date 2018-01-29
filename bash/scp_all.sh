#!/bin/bash
#Title: scp_all.sh
#Purpose: Transfer files TO or FROM a list of remote servers
#Date: 3/16/2017
#Version: 1.0
#Author: Daniel Oh
#Usage: ./scp_all.sh <transferdirection> <filepath> <user> <hostspath>

#############################################################
#############################################################

#Pre-Req Check
#if less than 4 arguments are supplied, display usage
	if [ "$#" -ne 4 ]
	then
		echo 'Usage: ./scp_all.sh <transferdirection> <filepath> <user> <hostspath>'
	exit 0
	fi

#Define Parameters
#Transferdirection Variable needs to be To or From
transferdirection=$1
file=$2
user=$3
hosts=$4


#If first parameter = to, transfer local file to servers
if [ "$1" == "to" ]
then
	while read line
	do
	scp $2 $3@$line:/home/$3
	done < $4
#If first parameter = from, transfer remote file to current local directory
elif [ "$1" == "from" ]
then
	while read line
	do
	scp $3@$line:/home/$3/$2 .
	done < $4
#Otherwise, give error message on requiring the parameter
else
	echo "Invalid Transfer Direction Set. Please use to or from as the first parameter"
fi




