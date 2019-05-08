#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build mysql client..."

cd ${MYSQL_CLIENT_SRC_DIR}

cp -f ${PATCH_DIR}/${MYSQL_CLIENT_BASENAME}/CMakeLists.txt ./

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${MYSQL_CLIENT_INSTALL_DIR} -DWITHOUT_SERVER=ON \
    -DCMAKE_PREFIX_PATH="${NCURSES_INSTALL_DIR};${ZLIB_INSTALL_DIR};${BOOST_INSTALL_DIR};${LIBEVENT_INSTALL_DIR};${OPENSSL_INSTALL_DIR}" .

# chmod +x ./configure

# if [ "${BUILD_TYPE}"x = "debug"x ]; then
#     ./configure --prefix=${MYSQL_CLIENT_INSTALL_DIR} --with-named-curses-libs=${NCURSES_INSTALL_DIR}/lib/libncurses.a --without-server --enable-thread-safe-client
# elif [ "${BUILD_TYPE}"x = "release"x ]; then
#     ./configure --prefix=${MYSQL_CLIENT_INSTALL_DIR} --with-named-curses-libs=${NCURSES_INSTALL_DIR}/lib/libncurses.a --without-server --enable-thread-safe-client
# else
#     echo "not supported build type: " ${BUILD_TYPE}
#     exit 1
# fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
