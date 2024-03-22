#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
repo_owner="sd2cv"
repo_name="rgbpi-addons"
branch="master"
path="RGBPi-Extra"
download_folder="$SCRIPT_DIR"
archive_url="https://github.com/$repo_owner/$repo_name/archive/$branch.tar.gz"
temp_dir=$(mktemp -d)

curl -sL "$archive_url" | tar -xz -C "$temp_dir"
mv -v "$temp_dir/$repo_name-$branch/$path" "$download_folder"
rm -rf "$temp_dir"

games_dat="$(df -P "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" | awk 'NR==2 {print $6}')/dats/games.dat"
data_to_insert='"","","ports","ports","/roms/ports/RGBPi-Extra/RGBPi-Extra.sh","RGBPi-Extra","?","?","19XX","1"'
sed -i '/Install RGBPi-Extra.sh/d' "$games_dat"
echo "$data_to_insert" >> "$games_dat"

(sleep 2; rm "$0") &

pkill -STOP rgbpiui.pyc
"$download_folder/$path/RGBPi-Extra.sh"
pkill -CONT rgbpiui.pyc