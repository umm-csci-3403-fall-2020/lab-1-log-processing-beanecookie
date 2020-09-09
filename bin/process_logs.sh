#!/usr/bin/env bash

here=$(pwd)

tmpdir=$(mktemp -d -t tmp_logs-XXX)


# loop tomake seperate directories for all the machines with the extracted contents of each machine handed to it.
# also runs process_client_logs on each set of secure files.
for r in "$@"
do
	noExt=$(basename -s .tgz "$r")
	mkdir "$tmpdir"/"$noExt"
       	tar -xzf "$r" -C "$tmpdir"/"$noExt"
	bin/process_client_logs.sh "$tmpdir"/"$noExt"
done

# calls each .sh scripts created to make one final report
bin/create_username_dist.sh "$tmpdir"
bin/create_hours_dist.sh "$tmpdir"
bin/create_country_dist.sh "$tmpdir"
bin/assemble_report.sh "$tmpdir"

mv "$tmpdir"/failed_login_summary.html "$here"

rm -r "$tmpdir"
