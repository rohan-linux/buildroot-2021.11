#!/bin/bash

set -ue

BOARD_DIR="$(dirname $0)"
SKELETON=${BOARD_DIR}/skeleton

source ${BOARD_DIR}/post-system.sh
source ${BOARD_DIR}/post-adb.sh
