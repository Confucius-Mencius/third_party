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
rm * -rf
# cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_PREFIX_PATH="${CURL_INSTALL_DIR};${OPENSSL_INSTALL_DIR}" \
#     -DBUILD_ONLY="s3;sts" -DENABLE_TESTING=OFF -DAUTORUN_UNIT_TESTS=OFF -DCMAKE_INSTALL_PREFIX=${AWS_SDK_CPP_INSTALL_DIR} ..

# 上面用CMAKE_PREFIX_PATH会报错
cmake -DOPENSSL_CRYPTO_LIBRARY=${OPENSSL_INSTALL_DIR}/lib/libcrypto.so -DOPENSSL_SSL_LIBRARY=${OPENSSL_INSTALL_DIR}/lib/libssl.so \
    -DOPENSSL_INCLUDE_DIR=${OPENSSL_INSTALL_DIR}/include -DCURL_LIBRARY=${CURL_INSTALL_DIR}/lib/libcurl.so -DCURL_INCLUDE_DIR=${CURL_INSTALL_DIR}/include \
    -DBUILD_ONLY="s3;sts" -DENABLE_TESTING=OFF ..

# 用ninja编不过
make -j ${LOGIC_CPU_COUNT}
sudo make install
