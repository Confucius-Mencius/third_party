#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

ARCHIVES_DIR=${SCRIPT_PATH}/../archives
PATCH_DIR=${SCRIPT_PATH}/../patch
LOGIC_CPU_COUNT=`cat /proc/cpuinfo | grep "processor" | wc -l`

###############################################################################
. ${SCRIPT_PATH}/common_define.sh

# 检查系统是32位还是64位
# if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ]; then
#     echo "64 bit os"
# else
#     echo "32 bit os"
# fi
