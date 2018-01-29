#!/bin/bash
#Title: search_string.sh
#Purpose: Search a local directory recursively for a specified string and save the output to the provided filepath
#Date: 7/5/2017
#Author: Daniel Oh
#Usage: ./search_string.sh <searchString> <searchPath> <savePath>

#Pre-Requisite Check
#If 3 Parameters are not supplied, display usage and exit

if [ "$#" -ne 3 ] 
	then
		echo 'Usage: ./search_string.sh <searchString> <searchPath> <savePath>'
	exit 0
	fi

#Define Parameters


searchString=$1
searchPath=$2
savePath=$3


#Grep the given search string at the given search path and save the output the given savePath

#Grep is Recursive, Case Insensitive

grep -Rie $1 $2 > $3/output.txt


