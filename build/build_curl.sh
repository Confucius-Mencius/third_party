#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build curl..."

cd ${CURL_SRC_DIR}

chmod +x buildconf
ACLOCAL_PATH=/usr/share/aclocal ./buildconf

export LD_LIBRARY_PATH=${OPENSSL_INSTALL_DIR}/lib:$LD_LIBRARY_PATH

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CPPFLAGS="-DOPENSSL_NO_SSL2" ./configure --prefix=${CURL_INSTALL_DIR} --with-ssl=${OPENSSL_INSTALL_DIR} --enable-debug
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    CPPFLAGS="-DOPENSSL_NO_SSL2" ./configure --prefix=${CURL_INSTALL_DIR} --with-ssl=${OPENSSL_INSTALL_DIR} --enable-optimize
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
