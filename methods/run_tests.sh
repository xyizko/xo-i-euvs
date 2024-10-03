#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors
mag1='\e[35m'
gr1='\e[32;1m'
nc='\e[0m'
sbg='\e[37;42m'

# Reports Directory 
DIR="reports"

# Reading commands from com.txt
COMM1=$(head -1 com.txt)
COMM2=$(tail -1 com.txt)

# Ececuting commands
main() {
    printf "$sbg STARTING....$nc\n"
    banner
    get_commands
    chk_dir "$DIR"
    hyper
    plot
    ls -al reports/
    echo -e "$gr1 Reports available at : $DIR"
    echo -e "Done: 👄"
}

# Display commands that have been read from com.txt
get_commands() {
    # Use the commands
    printf "$gr1 
Comapreing Execution Times Between
----------------------
COMM1: $COMM1
COMM2: $COMM2
"
}

# Executing Hyperfine 
hyper() {
    echo ""
    hyperfine \
    -N \
    --warmup 20 \
    "$COMM1" \
    "$COMM2" \
    --export-json "$DIR"/run.json \
    --export-markdown "$DIR"/run.md \
    --ignore-failure
}

# Make Boxplot
plot() {
     ./plots.py  \
     --title "$COMM1 vs $COMM2" \
     "$DIR"/run.json -o "$DIR"/run_plot.png
}

# Procedures Banner
banner() {
    printf "$mag1 
---
Comparing $COMM1 and $COMM2
---
$nc"
}

# Directory Check 
chk_dir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Creating Reports Directory : $1 created..."
  else
    echo "Directory $1 already exists."
  fi
}

# Main Banner
banner() {
  url="https://snips.sh/f/ZuwtQ3Pk0x?r=1"
  curl $url
}

# Execute main
main