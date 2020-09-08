#!/usr/bin/env bash

here=$(pwd)
clients=$@

tmpdir=$(mktemp -d -t tmp_logs-XXX)
#cd "$tmpdir" || exit

for r in "$@"
do
	noExt=$(basename -s .tgz "$r")
	mkdir "$tmpdir"/"$noExt"
       	tar -xzf "$r" -C "$tmpdir"/"$noExt"
done
