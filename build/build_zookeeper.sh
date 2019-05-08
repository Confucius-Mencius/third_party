#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build zookeeper..."

cd ${ZOOKEEPER_SRC_DIR}/zookeeper-client/zookeeper-client-c/

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${ZOOKEEPER_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${ZOOKEEPER_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean   
make -j ${LOGIC_CPU_COUNT}
sudo make install
