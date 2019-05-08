#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build gflags..."

cd ${GFLAGS_SRC_DIR}

# sed可以用来替换文本文件中的指定字符串，它的一般语法如下：
# 命令格式1：sed 's/原字符串/新字符串/' 文件
# 命令格式2：sed 's/原字符串/新字符串/g' 文件

# 没有“g”表示只替换第一个匹配到的字符串，有“g”表示替换所有能匹配到的字符串。

# sed支持自定义分隔符，在s的后面紧跟的就是自定义的分隔符。当你不方便转义字符串中'/'的时候，sed命令支持自定义分隔符，可以避开这个问题。

# 注意：sed双引号中的变量会被计算并替换，单引号不会

sed -i -e 's!set(CMAKE_DEBUG_POSTFIX "_debug")!#set(CMAKE_DEBUG_POSTFIX "_debug")!' ./CMakeLists.txt

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=${GFLAGS_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}

if [ ! -d ${GFLAGS_INSTALL_DIR} ]; then
    sudo mkdir -p ${GFLAGS_INSTALL_DIR}
fi

sudo cp -rf ./include ${GFLAGS_INSTALL_DIR}/
sudo cp -rf ./lib ${GFLAGS_INSTALL_DIR}/
