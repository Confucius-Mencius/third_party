#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build mariadb connector..."

cd ${MARIADB_CONNECTOR_SRC_DIR}

if [ ! -d ${BUILD_TYPE}_build ]; then
    mkdir ${BUILD_TYPE}_build
fi

cd ${BUILD_TYPE}_build

/usr/bin/cmake -G ${CMAKE_GENERATOR} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${MARIADB_CONNECTOR_INSTALL_DIR} \
    -DCMAKE_PREFIX_PATH="${CURL_INSTALL_DIR};${OPENSSL_INSTALL_DIR}" -DWITH_CURL=OFF ..
${RUN_MAKE_CMD}
${RUN_INSTALL_CMD}
