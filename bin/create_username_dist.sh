#!/usr/bin/env bash

client=$1
cd "$client" || exit

#sort failed login data by username and put into new file
sort -k 4 failed_login_data.txt > sorted_login_data.txt
awk -F "[: ]+" '{print $4}' sorted_login_data.txt > sorted_user_data.txt

#count the number of times a username is used
uniq -c sorted_user_data.txt > counted_user_data.txt
