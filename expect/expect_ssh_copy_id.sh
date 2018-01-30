#!/usr/bin/expect
#Title: expect_ssh_copy_id.sh
#Purpose: Copy over public ssh key to server
#Author: Mayank Deopa
#Version: 1.1 (Additions made by Daniel Oh)
#Usage: ./expect_ssh_copy_id.sh <server> <user> <password>


#Pre-Req Check
#if less than 3 arguments supplied, display warning and usage

if {[llength $argv] < 3} {
        send_user "Usage: ./remote_root_script.sh <user> <password> <server>"
        exit 1
}


#Uncomment line below for debugging
#exp_internal 1

#Define Parameters
set timeout 30
set server [lindex $argv 0]
set user [lindex $argv 1]
set password [lindex $argv 2]

send_user "connecting to $server using $user\n"

spawn ssh-copy-id $user@$server

expect {

	"(yes/no)? " {
	 	send_user  " (detected unknown host key - accepting)\n"
		send "yes\n"
		send_user "  (continuing expect loop)\n"
		exp_continue
			}
		"*assword:" {
	
		send_user  " (detected password login prompt - possibly token)\n"
		send_user  "$password\n"
		send "$password\n"
		exp_continue
			}

	}
