#!/usr/bin/env bash

here=$(pwd)
client=$1
cd "$client" || exit

#sort failed login data by username and put into new file
sort -k 4 */failed_login_data.txt | \
    awk -F "[: ]+" '{print $4}' | \
    uniq -c | \
    # putting usernames and # of tries into html \
    awk '{print  "data.addRow([\x27"$2"\x27, "$1"]);"}' > user_addrow.txt

#wrap the data and create the html file
"$here"/bin/wrap_contents.sh user_addrow.txt "$here"/html_components/username_dist username_dist.html
