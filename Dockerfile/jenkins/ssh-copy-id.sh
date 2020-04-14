#! /usr/bin/expect

spawn ssh-copy-id root@192.168.1.6
expect {
"yes/no" { send "yes\r" ; exp_continue}
"password" { send "wow-trend.com\r"; exp_continue}
}
