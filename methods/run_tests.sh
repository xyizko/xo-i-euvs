#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors
mag1='\e[35m'
red='\e[31m'
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
  check_required_commands
  banner
  get_commands
  chk_dir "$DIR"
  hyper
  plot
  ls -al reports/
  echo -e "$gr1▶️ Reports available at : $DIR"
  echo -e "Done: 👄"
}

# Check UV and Rust Installs
check_required_commands() {
  # Function to check if a command exists
  command_exists() {
    command -v "$1" >/dev/null 2>&1
  }

  # Function to print error message in red
  print_error() {
    echo -e "$mag1--- Checking required commands ---$nc"
    echo -e "$red$1$nc"
  }

  # Check if cargo is installed
  if ! command_exists cargo; then
    print_error "❌rust - https://www.rust-lang.org/tools/install"
    exit 1
  fi

  # Check if uv is installed
  if ! command_exists uv; then
    print_error "❌uv - https://docs.astral.sh/uv/getting-started/installation/"
    exit 1
  fi

  # Check if hyperfine is installed
  if ! command_exists hyperfine; then
    print_error "❌hyperfine - https://lib.rs/install/hyperfine"
    exit 1
  fi

  # If both commands are present, continue with the rest of the script
  echo -e "$gr1 ✅ cargo ✅ uv ✅ hyperfine"
}

# Display commands that have been read from com.txt
get_commands() {
  # Use the commands
  printf "$gr1 
Comapring Execution Times Between
────────────────────────────────
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
  echo -e "$gr1 --- Writing plots to $DIR ---$nc"
  uv run plots.py \
    --title "$COMM1 vs $COMM2" \
    "$DIR"/run.json -o "$DIR"/run_plot.png
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
