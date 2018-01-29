#!/usr/bin/expect
#Title: read_file.sh
#Purpose: Read contents of a remote file with sudo privileges
#Date: 3/17/2017
#Version: 1.0
#Author: Daniel Oh
#Usage: ./read_file.sh <user> <password> <server> <script>
##########################################################
##########################################################


#Pre-Req Check
#If 4 parameters are not supplied, display usage and exit

if {[llength $argv] < 4} {
                send_user "Usage: ./read_file.sh <user> <password> <server> <file>\n"
        exit 1
}

#Set Parameters
set user [lindex $argv 0]
set password [lindex $argv 1]
set server [lindex $argv 2]
set file [lindex $argv 3]

spawn ssh -qt $user@$server sudo ls $file

expect "assword"
send "$password\r"
expect eof
