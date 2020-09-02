#!/bin/env bash

client=$1 # the client log file
client_name=$(basename "$client")

# creating the tmp directory that will be working in
tmp_dir=$(mktemp -d -t processing_log-XXXX)

# extract the log file
tar -xzf "$client" -C "$tmp_dir"
