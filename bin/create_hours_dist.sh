#!/usr/bin/env bash

here=$(pwd)
client=$1
cd "$client" || exit

# sort failed login data by hour and put into file
sort -k 3 -- */failed_login_data.txt | \
    awk -F "[: ]+" '{print $3}' | \
    uniq -c | \
    # putting hours and # of tries in that hour into html \
    awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > hour_addrow.txt

# wrap the data and create the html file
"$here"/bin/wrap_contents.sh hour_addrow.txt "$here"/html_components/hours_dist hours_dist.html
