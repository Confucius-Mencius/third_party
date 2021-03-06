#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build gtest..."

cd ${GTEST_SRC_DIR}
cp -f ${PATCH_DIR}/${GTEST_BASENAME}/googletest/cmake/internal_utils.cmake ./googletest/cmake/

rm -rf ${BUILD_TYPE}_build
mkdir ${BUILD_TYPE}_build

cd ${BUILD_TYPE}_build

CXXFLAGS="-fPIC" /usr/bin/cmake -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${GTEST_INSTALL_DIR} ..
${RUN_MAKE_CMD}

if [ ! -d ${GTEST_INSTALL_DIR}/include ]; then
    sudo mkdir -p ${GTEST_INSTALL_DIR}/include
fi

if [ ! -d ${GTEST_INSTALL_DIR}/lib ]; then
    sudo mkdir -p ${GTEST_INSTALL_DIR}/lib
fi

sudo cp -rf ${GTEST_SRC_DIR}/googlemock/include/* ${GTEST_INSTALL_DIR}/include/
sudo cp -f ./googlemock/libgmock.a ${GTEST_INSTALL_DIR}/lib/
sudo cp -f ./googlemock/libgmock_main.a ${GTEST_INSTALL_DIR}/lib/

sudo cp -rf ${GTEST_SRC_DIR}/googletest/include/* ${GTEST_INSTALL_DIR}/include/
sudo cp -f ./googlemock/gtest/libgtest.a ${GTEST_INSTALL_DIR}/lib/
sudo cp -f ./googlemock/gtest/libgtest_main.a ${GTEST_INSTALL_DIR}/lib/

# 拷贝最新版gmock gen到py_tools中
rm -rf ${GTEST_SRC_DIR}/../../../py_tools/gmock_files_generator/cpp

cp -rf ${GTEST_SRC_DIR}/googlemock/scripts/generator/* ${GTEST_SRC_DIR}/../../../py_tools/gmock_files_generator/
