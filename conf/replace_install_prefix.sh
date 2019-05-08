#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

# replace third party install prefix

SCRIPT_PATH=$(cd `dirname $0`; pwd)

if [ $# != 2 ]; then
    echo "Usage: ./xx.sh <install prefix> <new install prefix>"
    exit 1
fi

FILE_LIST=${SCRIPT_PATH}/../patch/json2pb-master/Makefile
    ${SCRIPT_PATH}/../patch/tolua/tolua++-1.0.93/CMakeLists.txt
    ${SCRIPT_PATH}/../patch/tolua/toluapp/src/CMakeLists.txt
    ${SCRIPT_PATH}/../patch/tolua/tolua-5.2.4/CMakeLists.txt)

for i in ${FILE_LIST[@]}; do
    sed -i -e "s!$1!$2!g" ${i}
done
