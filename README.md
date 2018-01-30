# shell-automation

Shell scripts for automating system administration tasks

## Getting Started

What things you'll need to run these scripts

### Prerequisites

* Bash
* Expect
* SSH Key-Pair

### Installing

1. Bash is the default linux shell for almost every Linux distribution. To run in Windows, use a Unix-like environment tool like [Cygwin](https://www.cygwin.com/)

2. Expect, is an extension of the Tcl language written by Don Libes. It is a program used to automate interactions with programs that expose a text terminal interface. For example, when attempting to run a sudo command on a remote host and getting prompted for the password. 

Ubuntu-based 
```
yum install expect
```

Debian-based
```
apt-get install expect
```

3. Generate an SSH Key pair between local and remote machines so we can automatically login via SSH and not be prompted for a password everytime. This can easily be done across a list of servers using expect_ssh_copy_id.sh.

```
while read line
do; ./expect_ssh_copy_id.sh <user> <password> $line
done < list.txt
```
