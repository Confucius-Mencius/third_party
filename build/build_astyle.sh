#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/common.sh

echo "build astyle..."

cd ${ASTYLE_SRC_DIR}

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=/usr .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

# if [ ! -d ${ASTYLE_INSTALL_DIR}/bin ]; then
#     sudo mkdir -p ${ASTYLE_INSTALL_DIR}/bin
# fi

# sudo ln -s /usr/bin/astyle ${ASTYLE_INSTALL_DIR}/bin/astyle
