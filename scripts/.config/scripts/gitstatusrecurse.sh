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
BASE_DIR="$(realpath "$BASE_DIR")"

# Check if the supplied directory exists
if [ ! -d "$BASE_DIR" ]; then
  echo "Error: '$BASE_DIR' is not a directory or does not exist."
  exit 1
fi

# Find all subdirectories that contain a .git folder, ignoring permission errors
find "$BASE_DIR" -type d -name ".git" 2>/dev/null | while read -r git_dir; do
  
  # Resolve the repository root directory
  repo_dir="$(dirname "$git_dir")"
  
  # Check if the directory is accessible
  if [ ! -d "$repo_dir" ] || [ ! -x "$repo_dir" ]; then
    echo "Skipping inaccessible directory: $repo_dir"
    continue
  fi

  # Attempt to cd into the directory
  if ! cd "$repo_dir" 2>/dev/null; then
    echo "Skipping directory due to cd failure: $repo_dir"
    continue
  fi

  # Check if it's a valid git repository
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # Check for changes
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
      echo "Repository at '$repo_dir' has changes:"
      git status --short
      echo
    fi
  else
    echo "Skipping invalid git repository: $repo_dir"
  fi
done
