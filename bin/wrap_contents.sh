#!/usr/bin/env bash

# Parameters
content=$1 # what the content will be
bits=$2 # name of header and footer
result=$3 # finished result

header="$bits"_header.html # finds the proper header
footer="$bits"_footer.html # finds the proper footer

# Combine files and overwrite
cat "$header" "$content" "$footer" > "$result"
