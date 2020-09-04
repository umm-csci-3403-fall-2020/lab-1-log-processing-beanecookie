#!/usr/bin/env bash

client=$1
cd "$client" || exit

#sort failed login data by username and put into new file
sort -k 4 failed_login_data.txt > sorted_login_data.txt

#count the number of times a username is used
uniq -f 3 -c sorted_login_data.txt > counted_login_data.txt

#wrap the data and create the html file
#wrap_contents.sh counted_login_data.txt "$client" username_distribution.html
