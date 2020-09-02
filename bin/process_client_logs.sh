#!/bin/env bash

client=$1 # the client log file

# creating the tmp directory that will be working in
tmp_dir=$(mktemp -d -t processing_log-XXXX)

# extract the log file
tar -xzf "$client" -C "$tmp_dir"

# combine all secure files together
cd "$tmp_dir" || exit
cat -- */*/* > all.txt
