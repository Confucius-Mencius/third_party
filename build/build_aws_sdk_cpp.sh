#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build aws sdk cpp..."

cd ${AWS_SDK_CPP_SRC_DIR}

sed -i -e 's!list(APPEND AWS_COMPILER_WARNINGS "-Wall" "-Werror" "-pedantic" "-Wextra")!list(APPEND AWS_COMPILER_WARNINGS "-Wall" "-pedantic" "-Wextra")!' ./cmake/compiler_settings.cmake

sudo rm -rf ${BUILD_TYPE}_build
mkdir ${BUILD_TYPE}_build

cd ${BUILD_TYPE}_build

# 会在cmake的时候安装头文件，必须要sudo，后面的make也必须要sudo
sudo cmake -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} \
    -DTARGET_ARCH=LINUX -DBUILD_ONLY="s3;transfer;sts" \
    -DCMAKE_INSTALL_PREFIX=${AWS_SDK_CPP_INSTALL_DIR} ..

# sudo cmake -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} \
#     -DOPENSSL_CRYPTO_LIBRARY=${OPENSSL_INSTALL_DIR}/lib/libcrypto.so \
#     -DOPENSSL_SSL_LIBRARY=${OPENSSL_INSTALL_DIR}/lib/libssl.so \
#     -DOPENSSL_INCLUDE_DIR=${OPENSSL_INSTALL_DIR}/include \
#     -DCURL_LIBRARY=${CURL_INSTALL_DIR}/lib/libcurl.so \
#     -DCURL_INCLUDE_DIR=${CURL_INSTALL_DIR}/include \
#     -DBUILD_ONLY="s3;transfer;sts" -DENABLE_TESTING=OFF -DAUTORUN_UNIT_TESTS=OFF \
#     -DCMAKE_INSTALL_PREFIX=${AWS_SDK_CPP_INSTALL_DIR} ..

# sudo cmake -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DOPENSSL_ROOT_DIR=${OPENSSL_INSTALL_DIR} \
#     -DCURL_INCLUDE_DIR=${CURL_INSTALL_DIR}/include -DCURL_LIBRARY=${CURL_INSTALL_DIR}/lib \
#     -DBUILD_ONLY="s3;transfer;sts" -DENABLE_TESTING=OFF -DAUTORUN_UNIT_TESTS=OFF \
#     -DTARGET_ARCH=LINUX -DCMAKE_INSTALL_PREFIX=${AWS_SDK_CPP_INSTALL_DIR} ..



sudo ${RUN_MAKE_CMD}
${RUN_INSTALL_CMD}
