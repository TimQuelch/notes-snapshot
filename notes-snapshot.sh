#!/bin/sh

notesdir="/mnt/org/org/notes"

# Change to notes directory
cd "$notesdir" || exit

# Add all .org and .org_archive files
find . -iregex '.*\.org\(_archive\)?' -print0 | xargs -0 git add

# Remove deleted files
git diff --name-only --diff-filter=D -z | xargs -0 git rm --cached

# Commit changes
git commit --message="$(date)"

# Push changes to remote
git push origin
