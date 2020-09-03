#!/bin/env bash

client=$1 # the client log file
here=$(pwd)
# creating the tmp directory that will be working in
tmp_dir=$(mktemp -d -t processing_log-XXXX)

# extract the log file
tar -xzf "$client" -C "$tmp_dir"
#tar -xzf "client"/var/log/* -C "$tmp_dir"

# combine all secure files together
cd "$tmp_dir" || exit
cat var/log/* > combined.txt

# find the proper data
awk -F "[: ]+" '/Failed password for invalid user|Failed password for/{print  $1,$2,$3,$(NF-5),$(NF-3)}' combined.txt > failed_login_data.txt
#awk 'match($0, /(\w+) ([0-9]+) ([0-9]+):([0-9]+):([0-9]+) computer_name sshd[([0-9]+)]: Failed password for invalid user ([a-zA-Z]) from  ([0-9]+).([0-9]+).([0-9]+).([0-9]+) port ([0-9]+) ssh2/, groups) {print groups[1] "\n" groups[2] "\n" groups[3] "\n" groups[7] "\n" groups[8]"."groups[9]"."groups[10]"."groups[11]}' < combined.txt > failed_login_data.txt

# mv "$tmp_dir"/failed_login_data.txt "$here"/bin
