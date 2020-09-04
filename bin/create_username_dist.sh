#!/usr/bin/env bash

client=$1
cd "$client" || exit

#sort failed login data by username and put into new file
sort -k 4 failed_login_data.txt > sorted_login_data.txt
awk -F "[: ]+" '{print $4}' sorted_login_data.txt > sorted_user_data.txt

#count the number of times a username is used
uniq -c sorted_user_data.txt > counted_user_data.txt

# putting usernames and # of tries into html
awk -F "[: ]+" '{print  "data.addRow([\x27"$2"\x27, "$1"]);"}' counted_user_data.txt > user_addrow.txt

#wrap the data and create the html file
wrap_contents.sh user_addrow.txt html_components/username_dist username_dist.html
