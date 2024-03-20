#!/bin/bash

set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

mv -vn /opt/rgbpi/ui/config.ini /opt/rgbpi/ui/config.ini.bak

cp -v files/config.ini /opt/rgbpi/ui/config.ini

clear
echo
echo
echo "  CONFIG LOADED SUCCESSFULLY!"

reboot

