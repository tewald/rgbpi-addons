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

# Function to find the mount point of the script
get_mount_point() {
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local mount_point=$(df -P "$script_dir" | awk 'NR==2 {print $6}')
    echo "$mount_point"
}

# Find the mount point
mount_point=$(get_mount_point)

# Check if the mount point is not empty
if [ -n "$mount_point" ]; then
    # Path to the games.dat file
    games_dat="$mount_point/dats/games.dat"

    # Insert rgbpi-extra folders and files so a scan does not need to take place
    data_to_insert='
"","","ports","ports","/roms/ports/RGBPi-Extra/RGBPi-Extra.sh","RGBPi-Extra","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/a5200_update.sh","a5200_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/bluemsx_update.sh","bluemsx_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/cap32_update.sh","cap32_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/fbneo_update.sh","fbneo_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/flycast_update.sh","flycast_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/fuse_update.sh","fuse_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/genesis_plus_gx_update.sh","genesis_plus_gx_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/mame_update.sh","mame_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/mednafen_supergrafx_update.sh","mednafen_supergrafx_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/mesen_update.sh","mesen_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/mgba_update.sh","mgba_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/mupen64plus_next_update.sh","mupen64plus_next_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/neocd_update.sh","neocd_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/picodrive_update.sh","picodrive_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/puae_update.sh","puae_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/px64k_update.sh","px64k_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/same_cdi_update.sh","same_cdi_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/snes9x_update.sh","snes9x_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/stella_update.sh","stella_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/swanstation_update.sh","swanstation_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/cores/vice_x64_update.sh","vice_x64_update","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/data/cores/launchnds.sh","launchnds","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/data/drive/roms/nds/!Normal Mode.sh","!Normal Mode","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/data/drive/roms/nds/!Tate Mode.sh","!Tate Mode","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/Improve boot time (disables bluetooth).sh","Improve boot time (disables bluetooth)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/Improve boot time undo (enables bluetooth).sh","Improve boot time undo (enables bluetooth)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/Optimize Kodi UI for CRT (reboots).sh","Optimize Kodi UI for CRT (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/Retroarch GOD MODE (reboots).sh","Retroarch GOD MODE (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/Retroarch SUSER MODE (reboots).sh","Retroarch SUSER MODE (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/Retroarch USER MODE (reboots).sh","Retroarch USER MODE (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/change achievement sfx.sh","change achievement sfx","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/custom ini setup (reboots).sh","custom ini setup (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/custom ini setup undo (reboots).sh","custom ini setup undo (enables bluetooth)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/optimize core options.sh","optimize core options","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/reset scraper dat (reboots).sh","reset scraper dat (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/restore-scraper-dat (reboots).sh","restore-scraper-dat (reboots)","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/transparent 50 percent quick menu.sh","transparent 50 percent quick menu","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/transparent quick menu restore default.sh","transparent quick menu restore default","?","?","19XX","1"
"","","ports","ports","/roms/ports/RGBPi-Extra/application/scripts/transparent100 percent quick menu.sh","transparent100 percent quick menu","?","?","19XX","1"'

    # Remove install entry from games.dat
    sed -i '/Install RGBPi-Extra.sh/d' "$games_dat"

    # Append data to games.dat
    echo "$data_to_insert" >> "$games_dat"

    echo "Data inserted successfully."
else
    echo "Mount point not found."
fi

# Function to pause a process by name
pause_process() {
    process_name="$1"
    if pgrep -f "$process_name" > /dev/null; then
        pid=$(pgrep -f "$process_name")
        kill -STOP "$pid"
        echo "$(date +"%Y-%m-%d %T") - INFO: $process_name paused successfully."
    else
        echo "$(date +"%Y-%m-%d %T") - WARNING: No $process_name process found."
    fi
}

# Function to resume a process by name
resume_process() {
    process_name="$1"
    if pgrep -f "$process_name" > /dev/null; then
        pid=$(pgrep -f "$process_name")
        kill -CONT "$pid"
        echo "$(date +"%Y-%m-%d %T") - INFO: $process_name resumed successfully."
    else
        echo "$(date +"%Y-%m-%d %T") - WARNING: No $process_name process found."
    fi
}

# Start deletion process in the background
(sleep 2; rm "$0") &

# Main function
main() {
    # Pause rgbpiui.pyc process
    pause_process "rgbpiui.pyc"

    # Start RGBPi-Extra.sh script
    if [ -x "$(dirname "$0")/RGBPi-Extra/RGBPi-Extra.sh" ]; then
        "$(dirname "$0")/RGBPi-Extra/RGBPi-Extra.sh"
    else
        echo "$(date +"%Y-%m-%d %T") - ERROR: RGBPi-Extra.sh script is not executable or does not exist."
    fi

    # Resume rgbpiui.pyc process if the user exits without applying patch
    resume_process "rgbpiui.pyc"
}

# Run the main function
main
