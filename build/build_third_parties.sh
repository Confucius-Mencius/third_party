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
    ./build_aws_sdk_cpp.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build aws sdk cpp"
        exit 1
    fi

    # cd ${SCRIPT_PATH}
    # ./build_hiredis.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build hiredis"
    #     exit 1
    # fi

    # cd ${SCRIPT_PATH}
    # ./build_redis.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build redis"
    #     exit 1
    # fi

    # cd ${SCRIPT_PATH}
    # ./build_zookeeper.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build zookeeper"
    #     exit 1
    # fi

    echo `date` >>build_third_parties_time.txt
}

BuildAll ${BUILD_TYPE} 2>build_third_parties.error.log
