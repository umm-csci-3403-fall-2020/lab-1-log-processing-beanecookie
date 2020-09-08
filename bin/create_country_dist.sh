#!/usr/bin/env bash

here=$(pwd)
client=$1
cd "$client" || exit

#sorting the failed login data by IP address
sort -k 5 -- */failed_login_data.txt | \
	awk '{print $5}' > sortedIp.txt

#using join and awk to print country code and occurrence
join sortedIp.txt "$here"/etc/country_IP_map.txt | \
	awk '{print $2}' | \
	sort | \
	uniq -c | \
	awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > country_addrow.txt

#wrapping the contents into an html file
"$here"/bin/wrap_contents.sh country_addrow.txt "$here"/html_components/country_dist country_dist.html
