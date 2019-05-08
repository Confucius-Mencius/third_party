#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build openssl..."

cd ${OPENSSL_SRC_DIR}

chmod +x config

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./config threads shared -d --prefix=${OPENSSL_INSTALL_DIR} --openssldir=${OPENSSL_INSTALL_DIR}/etc
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./config threads shared --prefix=${OPENSSL_INSTALL_DIR} --openssldir=${OPENSSL_INSTALL_DIR}/etc
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install


# find . -name Makefile | xargs sed -i -e 's#-O3#-g#g'
