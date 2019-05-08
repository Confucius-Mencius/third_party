# FlatBuffers和Protocol Buffers以及Json的比较：
FlatBuffers的功能和Protocol Buffers很像，他们的最大不同点是在使用具体的数据之前，FlatBuffers不需要解析/解包的过程（也可以用--gen-object-api选项生成pack/unpack接口，但是效率会降低）。同时，在工程中使用时，FlatBuffers的引用比Protocol Buffers方便很多，只需要包含两三个头文件即可

JSON作为数据交换格式，被广泛用户各种动态语言之间（当然也包括静态语言）。它的优点是易于理解（可读性好），同时它的最大的缺点那就是解析时的性能问题了。而且因为它的动态类型特点，你的代码可能还需要多写好多类型、数据检查逻辑。

# 内置数值类型
## 8 bit
byte ubyte bool

## 16 bit
short ushort

## 32 bit
int uint float

## 64 bit
long ulong double

# 内置非数值类型
## vector
语法： 在类型上加一中括号

数组不能嵌套

## string
只能表示utf-8和7-bit ascii编码的数据。其它类型的数据通过数组[byte]或[ubyte]表示。

## enum
enum Color:byte { Red = 1, Green, Blue }

第一个元素的默认值为0，可以改变。

只能增加元素，不能删除元素。

## union
union Any { Monster, Weapon, Pickup }

只能作为table的字段，不能是root_type。

# table
table中的字段都是可选的，字段格式如下：

```
name:type[ = default_value];
```

未提供默认值时，字段的默认值为0或NULL。

table支持扩展，为了协议的前后兼容，新增字段一定要放在table的尾部，这样新代码解析旧数据时新增的字段取默认值；旧代码解析新数据时会忽略新增字段。

不能删除字段，将其标记为deprecated即可。

# struct
与table类似，但不支持扩展，即不能新增字段，也不能将不再使用的字段标记为deprecated。

字段没有默认值。

struct中只能包含数值类型的字段和其它的struct。

struct比table使用的内存少，访问速度也更快。

# namespace
namespace com.moon.game;

# include
包含其他的协议文件，例如：

```
include "mydefinitions.fbs";
```

# root type
declare the root table/struct of the serialized data.

在解析json时非常重要，因为json数据没有类型信息。

# flatc的使用
http://google.github.io/flatbuffers/flatbuffers_guide_using_schema_compiler.html

# 基本使用
http://google.github.io/flatbuffers/flatbuffers_guide_tutorial.html

# 高级使用
http://google.github.io/flatbuffers/flatbuffers_guide_use_cpp.html

