#!/bin/sh

BASE_PATH="~/Cloud/Dropbox/work/boxel/dockerfiles"
DIR_PATH="${BASE_PATH}/$1"
SKELETON_PATH="${BASE_PATH}/support/skeleton"

echo "Creating skeleton for $1"
mkdir -p ${DIR_PATH}
echo "  * created directory (${DIR_PATH})"

cp ${SKELETON_PATH}/* ${DIR_PATH}/
echo "  * copied skeleton"

