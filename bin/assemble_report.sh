#!/usr/bin/env bash

here=$(pwd)
client=$1
cd "$client" || exit

# collect and cat all three html files
cat country_dist.html hours_dist.html username_dist.html > combined.html

#wrap the combined within the new footer and header
"$here"/bin/wrap_contents.sh combined.html "$here"/html_components/summary_plots failed_login_summary.html
