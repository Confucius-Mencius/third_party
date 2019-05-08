#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build log4cplus..."

cd ${LOG4CPLUS_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${LOG4CPLUS_INSTALL_DIR} --enable-shared=yes --enable-static=no --with-python=no CXXFLAGS="-std=c++11"
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${LOG4CPLUS_INSTALL_DIR} --enable-shared=yes --enable-static=no --with-python=no CXXFLAGS="-std=c++11"
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean

cp -f ${PATCH_DIR}/${LOG4CPLUS_BASENAME}/src/threads.cxx ./src/

make -j ${LOGIC_CPU_COUNT}
sudo make install

if [ ! -d ${LOG4CPLUS_INSTALL_DIR}/bin ]; then
    sudo mkdir -p ${LOG4CPLUS_INSTALL_DIR}/bin
fi

sudo cp -f ${LOG4CPLUS_SRC_DIR}/loggingserver ${LOG4CPLUS_INSTALL_DIR}/bin/
