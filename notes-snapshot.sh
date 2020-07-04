#!/bin/sh

notesdir="/mnt/org/org/notes"
author="Tim Quelch <tim@tquelch.com>"

# Change to notes directory
cd "$notesdir" || exit

# Add all .org files
find . -iname "*.org" -print0 | xargs -0 git add

# Commit changes
git commit --message="$(date)" --author="$author"

# Push changes to remote
git push origin
