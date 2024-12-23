#!/usr/bin/env bash
#
# Usage: check-git.sh /path/to/base/directory
#
# This script recursively checks all subdirectories from the given folder
# and prints their path if 'git status' shows that there are changes or
# untracked files.

# Exit if no directory is supplied
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/base/directory"
  exit 1
fi

BASE_DIR="$1"

# Find all subdirectories that contain a .git folder
# and iterate over them.
find "$BASE_DIR" -type d -name ".git" | while read -r git_dir; do
  
  # The parent directory of .git is the repository root
  repo_dir="$(dirname "$git_dir")"
  
  # Move into the repository directory
  cd "$repo_dir" || continue

  # Check if there are changes using 'git status --porcelain' 
  # (which shows output only if something is different)
  if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
    echo "Repository at '$repo_dir' has changes:"
    git status --short
    echo
  fi

done
