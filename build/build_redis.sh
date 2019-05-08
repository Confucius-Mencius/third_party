#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build redis..."

cd ${REDIS_SRC_DIR}

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} PREFIX=${REDIS_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} PREFIX=${REDIS_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

sudo make PREFIX=${REDIS_INSTALL_DIR} install
