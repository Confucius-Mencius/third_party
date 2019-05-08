#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

# openh264、x264、ffmpeg在编译时使用汇编提高性能。

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/common.sh

echo "build nasm..."

cd ${NASM_SRC_DIR}

chmod +x ./configure
./configure --prefix=/usr

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
