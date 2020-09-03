#!/bin/env bash

client=$1 # the client log file

# creating the tmp directory that will be working in
tmp_dir=$(mktemp -d -t processing_log-XXXX)

# extract the log file
tar -xzf "$client" -C "$tmp_dir"

# combine all secure files together
cd "$tmp_dir" || exit
cat -- * > combined.txt

# find the proper data
awk -F "[: ]+" '/Failed password for invalid user|Failed password for/{print  $1,$2,$3,$(NF-5),$(NF-3)}' combined.txt > failed_login_data.txt
