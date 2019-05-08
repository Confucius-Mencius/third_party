#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

# 修改EVBUFFER_MAX_READ为16k，提高读性能
EVBUFFER_MAX_READ_16384=1

echo "build libevent..."

cd ${LIBEVENT_SRC_DIR}

chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CFLAGS="-g -ggdb -O0 -I${OPENSSL_INSTALL_DIR}/include" LDFLAGS="-L${OPENSSL_INSTALL_DIR}/lib" ./configure --prefix=${LIBEVENT_INSTALL_DIR} --disable-gcc-warnings
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    CFLAGS="-g -ggdb -O2 -I${OPENSSL_INSTALL_DIR}/include" LDFLAGS="-L${OPENSSL_INSTALL_DIR}/lib" ./configure --prefix=${LIBEVENT_INSTALL_DIR} --disable-gcc-warnings
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean

if [ ${EVBUFFER_MAX_READ_16384} -eq 1 ]; then
    cp -f ${PATCH_DIR}/${LIBEVENT_BASENAME}/buffer.c ./
fi

make -j ${LOGIC_CPU_COUNT}
sudo make install
