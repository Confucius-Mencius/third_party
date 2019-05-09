#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

THIRD_PARTY_INSTALL_PREFIX=/opt/third_party/${BUILD_TYPE}

CMAKE_BASENAME=cmake-3.14.2
ASTYLE_BASENAME=astyle_3.1
NASM_BASENAME=nasm-2.14.02
CURL_BASENAME=curl-7.64.1
GFLAGS_BASENAME=gflags-2.2.2
GTEST_BASENAME=googletest-release-1.8.1
GPERFTOOLS_BASENAME=gperftools-2.7
HIREDIS_BASENAME=hiredis-0.14.0
JSONCPP_BASENAME=jsoncpp-1.8.4
LIBEVENT_BASENAME=libevent-2.1.8-stable
LIBUNWIND_BASENAME=libunwind-1.3.1
LIBUUID_BASENAME=libuuid-1.0.3
LIBXML2_BASENAME=libxml2-2.9.9
LOG4CPLUS_BASENAME=log4cplus-2.0.4
OPENSSL_BASENAME=openssl-1.0.2r
PROTOBUF_BASENAME=protobuf-3.7.1
RAPIDJSON_BASENAME=rapidjson-1.1.0
REDIS_BASENAME=redis-5.0.4
ZOOKEEPER_BASENAME=zookeeper-3.4.14
MYSQL_CLIENT_BASENAME=mysql-5.6.40
HTTP_PARSER_BASENAME=http-parser-2.9.2
LIBB64_BASENAME=libb64-1.2.1

CMAKE_SRC_DIR=${ARCHIVES_DIR}/${CMAKE_BASENAME}
ASTYLE_SRC_DIR=${ARCHIVES_DIR}/${ASTYLE_BASENAME}
NASM_SRC_DIR=${ARCHIVES_DIR}/${NASM_BASENAME}
CURL_SRC_DIR=${ARCHIVES_DIR}/${CURL_BASENAME}
GFLAGS_SRC_DIR=${ARCHIVES_DIR}/${GFLAGS_BASENAME}
GTEST_SRC_DIR=${ARCHIVES_DIR}/${GTEST_BASENAME}
GPERFTOOLS_SRC_DIR=${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}
HIREDIS_SRC_DIR=${ARCHIVES_DIR}/${HIREDIS_BASENAME}
JSONCPP_SRC_DIR=${ARCHIVES_DIR}/${JSONCPP_BASENAME}
LIBEVENT_SRC_DIR=${ARCHIVES_DIR}/${LIBEVENT_BASENAME}
LIBUNWIND_SRC_DIR=${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}
LIBUUID_SRC_DIR=${ARCHIVES_DIR}/${LIBUUID_BASENAME}
LIBXML2_SRC_DIR=${ARCHIVES_DIR}/${LIBXML2_BASENAME}
LOG4CPLUS_SRC_DIR=${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}
OPENSSL_SRC_DIR=${ARCHIVES_DIR}/${OPENSSL_BASENAME}
PROTOBUF_SRC_DIR=${ARCHIVES_DIR}/${PROTOBUF_BASENAME}
RAPIDJSON_SRC_DIR=${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}
REDIS_SRC_DIR=${ARCHIVES_DIR}/${REDIS_BASENAME}
ZOOKEEPER_SRC_DIR=${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}
MYSQL_CLIENT_SRC_DIR=${ARCHIVES_DIR}/${MYSQL_CLIENT_BASENAME}
HTTP_PARSER_SRC_DIR=${ARCHIVES_DIR}/${HTTP_PARSER_BASENAME}
LIBB64_SRC_DIR=${ARCHIVES_DIR}/${LIBB64_BASENAME}

CMAKE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/cmake
ASTYLE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/astyle
NASM_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/nasm
CURL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/curl
GFLAGS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gflags
GTEST_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gtest
GPERFTOOLS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gperftools
HIREDIS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/hiredis
JSONCPP_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/jsoncpp
LIBEVENT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libevent
LIBUNWIND_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libunwind
LIBUUID_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libuuid
LIBXML2_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libxml2
LOG4CPLUS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/log4cplus
OPENSSL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/openssl
PROTOBUF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/protobuf
RAPIDJSON_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/rapidjson
REDIS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/redis
ZOOKEEPER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/zookeeper
MYSQL_CLIENT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/mysql_client
HTTP_PARSER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/http_parser
LIBB64_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libb64

SRC_DIR_LIST=(${CMAKE_SRC_DIR} ${ASTYLE_SRC_DIR} ${NASM_SRC_DIR} ${CURL_SRC_DIR} ${GFLAGS_SRC_DIR} ${GTEST_SRC_DIR} ${GPERFTOOLS_SRC_DIR} ${HIREDIS_SRC_DIR} ${JSONCPP_SRC_DIR} ${LIBEVENT_SRC_DIR} ${LIBUNWIND_SRC_DIR} ${LIBUUID_SRC_DIR} ${LIBXML2_SRC_DIR} ${LOG4CPLUS_SRC_DIR} ${OPENSSL_SRC_DIR} ${PROTOBUF_SRC_DIR} ${RAPIDJSON_SRC_DIR} ${REDIS_SRC_DIR} ${ZOOKEEPER_SRC_DIR} ${MYSQL_CLIENT_SRC_DIR} ${HTTP_PARSER_SRC_DIR} ${LIBB64_SRC_DIR})

LIB_LIST=(cmake astyle nasm curl gflags gtest gperftools hiredis jsoncpp libevent libunwind libuuid libxml2 log4cplus openssl protobuf rapidjson redis zookeeper mysql_client http_parser libb64)

function UnzipAll()
{
    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${CMAKE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${CMAKE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ASTYLE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ASTYLE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${NASM_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${NASM_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${CURL_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${CURL_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GFLAGS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GFLAGS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GTEST_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GTEST_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${HIREDIS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${HIREDIS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${JSONCPP_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${JSONCPP_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBEVENT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBEVENT_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBUUID_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBUUID_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBXML2_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBXML2_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${PROTOBUF_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${PROTOBUF_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${REDIS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${REDIS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MYSQL_CLIENT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MYSQL_CLIENT_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${HTTP_PARSER_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${HTTP_PARSER_BASENAME}.tar.gz
        exit 1
    fi

    unzip -o ${ARCHIVES_DIR}/${LIBB64_BASENAME}.zip -d ${ARCHIVES_DIR}
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBB64_BASENAME}.zip
        exit 1
    fi
}
