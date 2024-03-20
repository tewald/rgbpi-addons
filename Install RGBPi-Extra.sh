#!/bin/bash

# GitHub repository details
repo_owner="sd2cv"
repo_name="rgbpi-addons"
branch="master"
path="RGBPi-Extra"

# Folder to store downloaded files
download_folder="RGBPi-Extra"

# URL to download the archive
archive_url="https://github.com/$repo_owner/$repo_name/archive/$branch.tar.gz"

# Create download folder if it doesn't exist
mkdir -p "$download_folder"

# Download the archive and extract only the specified directory
curl -sL "$archive_url" | tar -xz --strip-components=2 -C "$download_folder" "$repo_name-$branch/$path"

echo "Files downloaded successfully."
