#!/usr/bin/expect
#Title: remote_root_command.sh
#Purpose: Run a command on a remote server with sudo privileges
#Date: 3/17/2017
#Version: 1.0
#Author: Daniel Oh
#Usage: ./remote_root_command.sh <user> <password> <server> <command>
#Notes: This is written with the Expect language due to the requirements of providing a password once a sudo command is issued. 

##########################################################################
##########################################################################

#Debugging
#Uncomment the line below for enhanced troubleshooting
#exp_internal 1


#Pre-Req Check
#if less than 4 arguments are supplied, display warning and usage

if {[llength $argv] < 4} {
	send_user "Usage: ./remote_root_script.sh <user> <password> <server> <command>\n"
	exit 1
}

#Define Parameters

set user [lindex $argv 0]
set password [lindex $argv 1]
set server [lindex $argv 2]
set command [lindex $argv 3]

#SSH and Run Script with Sudo Privileges
#-q is quiet mode, allows the banners, warning, and diagnostic messages to be suppressed
#-t Forces a pseudo-terminal allocation. 

spawn ssh -qt $user@$server sudo $command

#Expect a password prompt, and input password automatically
expect "assword"
send "$password\r"
expect eof

