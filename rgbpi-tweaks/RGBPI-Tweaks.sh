#!/bin/bash

set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

python main.py
