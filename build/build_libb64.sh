#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libb64..."

cd ${LIBB64_SRC_DIR}

cp -f ${PATCH_DIR}/${LIBB64_BASENAME}/src/so_makefile ./src/

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    cd ${LIBB64_SRC_DIR}/src
    make -j ${LOGIC_CPU_COUNT} -f so_makefile MYCFLAGS="-g -O0"
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    cd ${LIBB64_SRC_DIR}/src
    make -j ${LOGIC_CPU_COUNT} -f so_makefile MYCFLAGS="-g -O3"
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

if [ ! -d ${LIBB64_INSTALL_DIR}/include ]; then
    sudo mkdir -p ${LIBB64_INSTALL_DIR}/include
fi

if [ ! -d ${LIBB64_INSTALL_DIR}/lib ]; then
    sudo mkdir -p ${LIBB64_INSTALL_DIR}/lib
fi

cd ${LIBB64_SRC_DIR}

sudo cp -rf ./include/b64/*.h ${LIBB64_INSTALL_DIR}/include/
sudo cp -rf ./src/*.so ${LIBB64_INSTALL_DIR}/lib/
