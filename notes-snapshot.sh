#!/bin/sh

# Change to notes directory
cd "/mnt/org/notes" || exit

# Add all .org files
find . -iname "*.org" -print0 | xargs -0 git add

# Commit changes
git commit -m "$(date)"

# Push changes to remote
git push origin
