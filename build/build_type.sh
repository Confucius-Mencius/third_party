#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

if [ $# != 1 ]; then
    echo "Usage: ${SCRIPT_PATH}/build_type.sh <debug|release>"
    exit 0
fi

BUILD_TYPE=$1

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CMAKE_BUILD_TYPE_VALUE=Debug
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    CMAKE_BUILD_TYPE_VALUE=Release
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
