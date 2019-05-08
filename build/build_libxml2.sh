#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libxml2..."

cd ${LIBXML2_SRC_DIR}

chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${LIBXML2_INSTALL_DIR} --without-python --with-zlib=${ZLIB_INSTALL_DIR} --with-lzma=${XZ_INSTALL_DIR} --with-debug
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${LIBXML2_INSTALL_DIR} --without-python --with-zlib=${ZLIB_INSTALL_DIR} --with-lzma=${XZ_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
