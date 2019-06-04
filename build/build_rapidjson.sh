#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build rapidjson..."

cd ${RAPIDJSON_SRC_DIR}

sed -i -e 's!-Werror!-Wno-implicit-fallthrough!' ${RAPIDJSON_SRC_DIR}/CMakeLists.txt

if [ ! -d ${BUILD_TYPE}_build ]; then
    mkdir ${BUILD_TYPE}_build
fi

cd ${BUILD_TYPE}_build

/usr/bin/cmake -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${RAPIDJSON_INSTALL_DIR} ..
${RUN_MAKE_CMD}
${RUN_INSTALL_CMD}
