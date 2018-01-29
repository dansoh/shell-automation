#!/bin/bash
#Title: wrapper_remote_script.sh
#Purpose: A wrapper script that runs a local script across a list of servers.
#Purpose: The wrapper is used due to working with the expect language inside bash
#Date: 3/17/2017
#Version: 1.0
#Author: Daniel Oh
#Usage: ./wrapper_remote_script.sh <user> <password> <hostlist> <localscript> <optional:remotefile>

################################################################
################################################################

#For debugging purposes, uncomment the line below
#exp_internal 1

#if less than 4 arguments are supplied, display usage
        if [ "$#" -ne 5 ]
        then
                echo 'Usage: ./wrapper_remote_script.sh <user> <password> <hostlist> <localscript> <remotefile>'
        exit 0
        fi

#Define Parameters

user=$1
password=$2
host=$3
localscript=$4
remotescript=$5

#While Loop that runs the Local Script that will execute the defined remotescript

while read line
do
	./$4 $1 $2 $line $5
	echo $line
done < $3
