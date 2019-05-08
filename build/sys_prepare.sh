#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

if [ "$(id -u)" != "0" ]; then
    echo "the script should be executed as root" 1>&2
    exit -1
fi

###############################################################################
if grep -Fxq "/usr/lib" /etc/ld.so.conf
then
    echo "/usr/lib found in /etc/ld.so.conf"
else
    echo "/usr/lib not found in /etc/ld.so.conf"
    echo "/usr/lib" | tee -a /etc/ld.so.conf
    ldconfig -f /etc/ld.so.conf
fi

if grep -Fxq "/usr/local/lib" /etc/ld.so.conf
then
    echo "/usr/local/lib found in /etc/ld.so.conf"
else
    echo "/usr/local/lib not found in /etc/ld.so.conf"
    echo "/usr/local/lib" | tee -a /etc/ld.so.conf
    ldconfig -f /etc/ld.so.conf
fi

###############################################################################
if [ $(command -v apt-get) ]; then
    apt-get update # 如果是开发机，可以随便升级；如果是线上服务器，不要随便升级（注释掉）
    apt-get install build-essential -y
    PACKAGE_MGR="apt-get"
    PACKAGE_LIST="lsb-release unzip pigz valgrind"
elif [ $(command -v yum) ]; then
    yum groupinstall "Development tools" -y
    PACKAGE_MGR="yum"
    PACKAGE_LIST="redhat-lsb xz unzip pigz valgrind"
else
    echo "not supported os"
    exit 1
fi

if [ ! x"${PACKAGE_LIST}" = x ]; then
    ${PACKAGE_MGR} install ${PACKAGE_LIST} -y
fi
