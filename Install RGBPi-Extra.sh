#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# GitHub repository details
repo_owner="sd2cv"
repo_name="rgbpi-addons"
branch="master"
path="RGBPi-Extra"

# Folder to store downloaded files
download_folder="$SCRIPT_DIR"

# URL to download the archive
archive_url="https://github.com/$repo_owner/$repo_name/archive/$branch.tar.gz"

# Create a temporary directory
temp_dir=$(mktemp -d)

# Download the archive
curl -sL "$archive_url" | tar -xz -C "$temp_dir"

# Move the directory to the specified location
mv -v "$temp_dir/$repo_name-$branch/$path" "$download_folder"

# Clean up the temporary directory
rm -rf "$temp_dir"

echo "Files downloaded successfully."
