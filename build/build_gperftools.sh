#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build gperftools..."

cd ${GPERFTOOLS_SRC_DIR}

chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CPPFLAGS="-I${LIBUNWIND_INSTALL_DIR}/include" LDFLAGS="-L${LIBUNWIND_INSTALL_DIR}/lib" ./configure --prefix=${GPERFTOOLS_INSTALL_DIR} --enable-libunwind
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    CPPFLAGS="-I${LIBUNWIND_INSTALL_DIR}/include" LDFLAGS="-L${LIBUNWIND_INSTALL_DIR}/lib" ./configure --prefix=${GPERFTOOLS_INSTALL_DIR} --enable-libunwind
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
