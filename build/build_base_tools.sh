#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

if [ "$(id -u)" != "0" ]; then
    echo "the script should be executed as root" 1>&2
    exit -1
fi

SCRIPT_PATH=$(cd `dirname $0`; pwd)

chmod +x ${SCRIPT_PATH}/*.sh

. ${SCRIPT_PATH}/common.sh

function BuildAll
{
    CUR_GCC_VER="$(gcc --version | head -n1 | cut -d" " -f4)"
    CXX11_GCC_VER="4.7"

    echo `date` >build_base_tools_time.txt

    cd ${SCRIPT_PATH}
    ./build_cmake.sh
    if [ $? -ne 0 ]; then
        echo "failed to build cmake"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_nasm.sh
    if [ $? -ne 0 ]; then
        echo "failed to build nasm"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_astyle.sh
    if [ $? -ne 0 ]; then
        echo "failed to build astyle"
        exit 1
    fi

    echo `date` >>build_base_tools_time.txt
}

BuildAll 2>build_base_tools.error.log
