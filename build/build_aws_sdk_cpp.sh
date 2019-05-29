#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build aws sdk cpp..."

cd ${AWS_SDK_CPP_SRC_DIR}

if [ ! -d ${BUILD_TYPE}_build ]; then
    mkdir ${BUILD_TYPE}_build
fi

cd ${BUILD_TYPE}_build

# 会在cmake的时候安装头文件，必须要sudo，后面的make也必须要sudo
sudo cmake -G ${CMAKE_GENERATOR} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_PREFIX_PATH="${OPENSSL_INSTALL_DIR};${CURL_INSTALL_DIR}" \
    -DBUILD_ONLY="s3;sts" -DENABLE_TESTING=OFF -DAUTORUN_UNIT_TESTS=OFF -DCMAKE_INSTALL_PREFIX=${AWS_SDK_CPP_INSTALL_DIR} ..
sudo ${RUN_MAKE_CMD}
${RUN_INSTALL_CMD}
