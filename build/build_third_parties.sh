###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

# if [ "$(id -u)" != "0" ]; then
#     echo "the script must be run as root" 1>&2
#     exit -1
# fi

SCRIPT_PATH=$(cd `dirname $0`; pwd)

chmod +x ${SCRIPT_PATH}/*.sh

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

function BuildAll
{
    CUR_GCC_VER="$(gcc --version | head -n1 | cut -d" " -f4)"
    CXX11_GCC_VER="4.7"

    echo `date` >build_third_parties_time.txt

    cd ${SCRIPT_PATH}
    ./build_openssl.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build openssl"
        exit 1
    fi
    
    cd ${SCRIPT_PATH}
    ./build_curl.sh $1 # 依赖openssl
    if [ $? -ne 0 ]; then
        echo "failed to build curl"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_gflags.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build gflags"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_gtest.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build gtest"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libunwind.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libunwind"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_gperftools.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build gperftools"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_rapidjson.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build rapidjson"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_jsoncpp.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build jsoncpp"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libevent.sh $1 # 依赖openssl
    if [ $? -ne 0 ]; then
        echo "failed to build libevent"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libuuid.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libuuid"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libxml2.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libxml2"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_log4cplus.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build log4cplus"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_protobuf.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build protobuf"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_hiredis.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build hiredis"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_redis.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build redis"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_zookeeper.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build zookeeper"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_mysql_client.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build mysql client"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_http_parser.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build http parser"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libb64.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libb64"
        exit 1
    fi

    echo `date` >>build_third_parties_time.txt
}

BuildAll ${BUILD_TYPE} 2>build_third_parties.error.log
