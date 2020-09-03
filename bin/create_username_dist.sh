#!/usr/bin/env bash

client=$1
cd "$client" || exit

#sort failed login data by username and put into new file
sort -k 4 -o failed_login_data.txt > sorted_login_data.txt

#count the number of times a username is used
uniq -c sorted_login_data.txt
