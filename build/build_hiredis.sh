#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build hiredis..."

cd ${HIREDIS_SRC_DIR}

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} PREFIX=${HIREDIS_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} PREFIX=${HIREDIS_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
sudo make PREFIX=${HIREDIS_INSTALL_DIR} install
