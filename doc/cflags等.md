# CFLAGS
Extra flags to give to the C compiler.

# CXXFLAGS
Extra flags to give to the C++ compiler.

# CPPFLAGS
Extra flags to give to the C preprocessor and programs that use it (the C and Fortran compilers).

# LDFLAGS
Extra flags to give to compilers when they are supposed to invoke the linker, ‘ld’, such as -L. Libraries (-lfoo) should be added to the LDLIBS variable instead.

# c pre processor(cpp)
预处理器不止一种，而C/C++的预处理器就是其中最低端的一种——词法预处理器。这种预处理器做的主要是进行文本替换、宏展开、删除注释这类简单工作。再具体一点就是，预处理器cpp就是负责展开源文件中的宏，并把”#include ”的内容插入这类的工作。
