#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

THIRD_PARTY_INSTALL_PREFIX=/opt/third_party/${BUILD_TYPE}

CMAKE_BASENAME=cmake-3.14.2
NASM_BASENAME=nasm-2.14.02
ASTYLE_BASENAME=astyle_3.1
OPENSSL_BASENAME=openssl-1.0.2r
CURL_BASENAME=curl-7.64.1
GFLAGS_BASENAME=gflags-2.2.2
GTEST_BASENAME=googletest-release-1.8.1
LIBUNWIND_BASENAME=libunwind-1.3.1
GPERFTOOLS_BASENAME=gperftools-2.7
LIBUUID_BASENAME=libuuid-1.0.3
LIBEVENT_BASENAME=libevent-2.1.8-stable
LIBXML2_BASENAME=libxml2-2.9.9
LOG4CPLUS_BASENAME=log4cplus-2.0.4
HTTP_PARSER_BASENAME=http-parser-2.9.2
PROTOBUF_BASENAME=protobuf-3.7.1
RAPIDJSON_BASENAME=rapidjson-1.1.0
MARIADB_CONNECTOR_BASENAME=mariadb-connector-c-3.0.9-src
HIREDIS_BASENAME=hiredis-0.14.0
REDIS_BASENAME=redis-5.0.4
ZOOKEEPER_BASENAME=zookeeper-3.4.14

CMAKE_SRC_DIR=${ARCHIVES_DIR}/${CMAKE_BASENAME}
NASM_SRC_DIR=${ARCHIVES_DIR}/${NASM_BASENAME}
ASTYLE_SRC_DIR=${ARCHIVES_DIR}/${ASTYLE_BASENAME}
OPENSSL_SRC_DIR=${ARCHIVES_DIR}/${OPENSSL_BASENAME}
CURL_SRC_DIR=${ARCHIVES_DIR}/${CURL_BASENAME}
GFLAGS_SRC_DIR=${ARCHIVES_DIR}/${GFLAGS_BASENAME}
GTEST_SRC_DIR=${ARCHIVES_DIR}/${GTEST_BASENAME}
LIBUNWIND_SRC_DIR=${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}
GPERFTOOLS_SRC_DIR=${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}
LIBUUID_SRC_DIR=${ARCHIVES_DIR}/${LIBUUID_BASENAME}
LIBEVENT_SRC_DIR=${ARCHIVES_DIR}/${LIBEVENT_BASENAME}
LIBXML2_SRC_DIR=${ARCHIVES_DIR}/${LIBXML2_BASENAME}
LOG4CPLUS_SRC_DIR=${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}
HTTP_PARSER_SRC_DIR=${ARCHIVES_DIR}/${HTTP_PARSER_BASENAME}
PROTOBUF_SRC_DIR=${ARCHIVES_DIR}/${PROTOBUF_BASENAME}
RAPIDJSON_SRC_DIR=${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}
MARIADB_CONNECTOR_SRC_DIR=${ARCHIVES_DIR}/${MARIADB_CONNECTOR_BASENAME}
HIREDIS_SRC_DIR=${ARCHIVES_DIR}/${HIREDIS_BASENAME}
REDIS_SRC_DIR=${ARCHIVES_DIR}/${REDIS_BASENAME}
ZOOKEEPER_SRC_DIR=${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}

CMAKE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/cmake
NASM_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/nasm
ASTYLE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/astyle
OPENSSL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/openssl
CURL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/curl
GFLAGS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gflags
GTEST_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gtest
LIBUNWIND_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libunwind
GPERFTOOLS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gperftools
LIBUUID_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libuuid
LIBEVENT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libevent
LIBXML2_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libxml2
LOG4CPLUS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/log4cplus
HTTP_PARSER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/http_parser
PROTOBUF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/protobuf
RAPIDJSON_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/rapidjson
MARIADB_CONNECTOR_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/mariadb_connector
HIREDIS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/hiredis
REDIS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/redis
ZOOKEEPER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/zookeeper

SRC_DIR_LIST=(${CMAKE_SRC_DIR} ${NASM_SRC_DIR} ${ASTYLE_SRC_DIR} ${OPENSSL_SRC_DIR} ${CURL_SRC_DIR} ${GFLAGS_SRC_DIR} ${GTEST_SRC_DIR} ${LIBUNWIND_SRC_DIR} ${GPERFTOOLS_SRC_DIR} ${LIBUUID_SRC_DIR} ${LIBEVENT_SRC_DIR} ${LIBXML2_SRC_DIR} ${LOG4CPLUS_SRC_DIR} ${HTTP_PARSER_SRC_DIR} ${PROTOBUF_SRC_DIR} ${RAPIDJSON_SRC_DIR} ${MARIADB_CONNECTOR_SRC_DIR} ${HIREDIS_SRC_DIR} ${REDIS_SRC_DIR} ${ZOOKEEPER_SRC_DIR})

LIB_LIST=(cmake nasm astyle openssl curl gflags gtest libunwind gperftools libuuid libevent libxml2 log4cplus http_parser protobuf rapidjson mariadb_connector hiredis redis zookeeper)

function UnzipAll()
{
    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${CMAKE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${CMAKE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${NASM_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${NASM_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ASTYLE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ASTYLE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz
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

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBUUID_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBUUID_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBEVENT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBEVENT_BASENAME}.tar.gz
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

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${HTTP_PARSER_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${HTTP_PARSER_BASENAME}.tar.gz
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

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MARIADB_CONNECTOR_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MARIADB_CONNECTOR_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${HIREDIS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${HIREDIS_BASENAME}.tar.gz
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
}
