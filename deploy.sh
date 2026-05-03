#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

required_hugo_version="0.160.1"
installed_hugo_version="$(hugo version | sed -n 's/^hugo v\([0-9.]*\).*/\1/p')"
if [ "$installed_hugo_version" != "$required_hugo_version" ]; then
	printf "Expected Hugo %s, found %s\n" "$required_hugo_version" "${installed_hugo_version:-unknown}"
	exit 1
fi

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
