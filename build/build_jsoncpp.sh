#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build jsoncpp..."

cd ${JSONCPP_SRC_DIR}

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=${JSONCPP_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

# cp -d -f ./src/lib_json/libjsoncpp.a ${JSONCPP_INSTALL_DIR}/lib
# cp -d -f ./src/lib_json/libjsoncpp.so.0 ${JSONCPP_INSTALL_DIR}/lib
# cp -d -f ./src/lib_json/libjsoncpp.so ${JSONCPP_INSTALL_DIR}/lib
# cp -d -f ./src/lib_json/libjsoncpp.so.0.10.6 ${JSONCPP_INSTALL_DIR}/lib
