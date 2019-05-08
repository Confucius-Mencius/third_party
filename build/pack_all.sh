#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

TARGET_LIB_DIR=${SCRIPT_PATH}/../lib
TARGET_BIN_DIR=${SCRIPT_PATH}/../bin

if [ ! -d ${TARGET_LIB_DIR} ]; then
    mkdir -p ${TARGET_LIB_DIR}
fi

if [ ! -d ${TARGET_BIN_DIR} ]; then
    mkdir -p ${TARGET_BIN_DIR}
fi

for i in ${LIB_LIST[@]}; do
    FROM_DIR=${THIRD_PARTY_INSTALL_PREFIX}/${i}/lib

    if [ -d ${FROM_DIR} ]; then
        cp -d -f ${FROM_DIR}/lib*.so* ${TARGET_LIB_DIR} >/dev/null 2>&1
    fi

    FROM_DIR=${THIRD_PARTY_INSTALL_PREFIX}/${i}/lib64

    if [ -d ${FROM_DIR} ]; then
        cp -d -f ${FROM_DIR}/lib*.so* ${TARGET_LIB_DIR} >/dev/null 2>&1
    fi

    FROM_DIR=${THIRD_PARTY_INSTALL_PREFIX}/${i}/bin

    if [ -d ${FROM_DIR} ]; then
        cp -d -rf ${FROM_DIR}/* ${TARGET_BIN_DIR} >/dev/null 2>&1
    fi
done

# pack其他库和文件
cp -rf ${LIBMAGIC_SRC_DIR}/magic/magic.mgc ${TARGET_BIN_DIR} >/dev/null 2>&1
