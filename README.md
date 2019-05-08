# third_party
third party libraries used in Linux server programming

verified in CentOS 7/LinuxMint 18/Ubuntu 16.04 and above, c++11 needed.

Linux C++服务器开发用到的一些第三方库，包括：gflags、gtest、libxml2、log4cplus、libevent、libwebsockets、openssl等，集中管理这些库的版本更新、编译安装、相互依赖等。目的是提供一套统一的第三方库管理工具，开发者不用关心各个库具体是怎么编译的，以及各个库之间是什么依赖关系等。

在一台机器上编译安装好后，开发机操作系统环境相同时，只需要mount即可，不需要每个开发人员都再编译一遍。[how to mount](doc/howto%20mount.md)

## archives目录

第三方库源码压缩包。

## build目录

编译、安装脚本。

脚本执行顺序：
1. sys_prepare.sh
2. unzip_all.sh # 可重复执行
3. build_base_tools.sh # 编译、安装系统工具，一般执行一次即可
4. build_third_parties.sh debug|release # 编译、安装第三方库，可重复执行，也可以单独执行一个脚本，如；build_gflags.sh debug|release
6. pack_all.sh [可选]

## cmake目录

common_define.cmake是根据conf目录的配置自动生成的cmake文件，third_party.cmake是公共的cmake文件，其中对一些特殊路径会做额外处理。

## conf目录

third_party.csv: 第三方库版本配置文件。将第三方库的配置写在这个csv文件中，脚本处理这个文件自动生成cmake、shell、makefile等公共文件。


当更新第三方库的版本时，修改csv文件中的条目，然后运行"main.sh /opt/third_party"。其中/opt/third_party是install prefix，可以根据实际情况指定。

添加第三方库xxx时，也需要运行"main.sh /opt/third_party"。然后在build目录下增加一个build_xxx.sh脚本，在build_third_parties.sh文件中增加编译该库的一个条目。

除紧急bug外，每年的4月和10月例行更新第三方库的版本。

## doc目录

文档。

## patch目录

对第三方库的一些修改。

当需要修改某个库的源码时，将修改好的文件放在这个目录中，然后修改对应的编译脚本，在编译之前将这些文件从patch目录拷贝到源码目录。

## TODO

梳理每个库的debug编译和release编译，对程序性能有影响。

不再编译系统自带的一些基础库，梳理sysprepare、build base tools

将build base tools改为build tools，将build third parties拆分为build framework libs和buils extra libs两个脚本，根据需要减少编译时间。
