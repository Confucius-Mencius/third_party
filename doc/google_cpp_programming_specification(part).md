---
文件夹名一律小写，单词之间用下划线连接。

---
文件名一律小写，单词之间用下划线连接。

---
源文件名以.cpp结尾，头文件名以.h结尾，接口头文件名以_interface.h结尾。

---
头文件#define保护的格式：#define 工程名_文件夹名1_子文件夹名2_头文件名_H_，全部大写，单词之间用下划线连接。

---
头文件，特别是接口头文件中，不是必须用#include包含的，可以用前置声明代替，如class xx;，这样做可以减少编译依赖。

---
源文件foo.cpp中的#include顺序：

	1. foo.h
	2. C 系统文件
	3. C++ 系统文件
	4. 第三方库的.h文件
	5. 本项目内.h文件

其中每个部分按ASCII码值升序排列。

---
类的访问控制区段的声明顺序依次为：public，protected，private。如果某区段没内容，可以不声明。

每个区段内的声明通常按以下顺序：

	1. typedefs和枚举
	2. 常量
	3. 构造函数
	4. 析构函数
	5. 成员函数，含静态成员函数
	6. 数据成员，含静态数据成员

将类的所有数据成员声明为private。

---
基本数据类型建议使用int8_t, int32_t, int32_t, int64_t, float, double，不建议直接使用char, short, int, long等。

---
无符号数在与0比较时很容易除错，建议不要使用uint32_t等无符号整型（除非你是在表示一个位组而不是一个数值，或是你需要定义二进制补码溢出），尤其是不要为了指出数值永不会为负而使用无符号类型。

---
namespace名全小写，单词之间用下划线连接。

不建议用using namespace std;提前声明，建议用namespace的全路径，如std::string。

---
类型名的每个单词首字母均大写，单词之间不要包含下划线，如：MyExcitingClass、MyExcitingEnum。

所有类型命名，包括类、结构体、类型定义 (typedef)、枚举，均使用该命名规则。

接口名以Interface为后缀。

---
变量名一律小写，单词之间用下划线连接，如：
	
	my_exciting_local_variable

类的成员变量以下划线结尾，如：

	my_exciting_member_variable_

结构体的数据成员不用像类的成员变量那样以下划线结尾：

	struct UrlTableProperties {
	    string name;
	    int num_entries;
	}

全局变量以g_作为前缀。

---
所有编译时常量，无论是局部的、全局的、还是类中的，和其他变量稍微区别一下，以k后接大写字母开头的单词，如：
	
	const int kDaysInAWeek = 7; 

单独的枚举值应该优先采用常量的命名方式，但宏方式的命名也可以接受，如：

	enum UrlTableErrors {
	    kOK = 0,
	    kErrorOutOfMemory,
	    kErrorMalformedInput,
	};
	
	enum AlternateUrlTableErrors {
	    OK = 0,
	    OUT_OF_MEMORY = 1,
	    MALFORMED_INPUT = 2,
	};

**但是一般我们还是习惯用以下划线连接的全大写单词表示常量、枚举等。**

---
尽量不要用省略字母的缩写，除非这样的缩写是公认的：

	int error_count;  // Good.
	int error_cnt;    // Bad.

---
常规函数：函数名的每个单词首字母大写，没有下划线，如：

	AddTableEntry()
	DeleteUrl()

取值和设值函数：取值和设值函数要与存取的变量名匹配，如int num_entries_ 是该类的实例变量，则相应的存取函数为：
	
	class MyClass {
	    public:
	        ...
	        int num_entries() const { return num_entries_; }
	        void set_num_entries(int num_entries) { num_entries_ = num_entries; }
	
	    private:
	        int num_entries_;
	};

一般在头文件中把存取函数定义成内联函数。

函数参数顺序从左到右为：输入参数，然后是输出参数。[**也可以反过来，只要保持一致即可**]

避免使用缺省函数参数，特别是在接口中定义中禁止使用。

---
不在构造函数中做太多逻辑相关的初始化，建议提供Initialize和Finalize函数做初始化和清理相关的工作。

建议为所有类提供一个无参的构造函数和析构函数，以覆盖编译器的默认行为。

为避免隐式转换，应该将单参数的构造函数声明为explicit的。

---
在声明的变量或参数前加上关键字const用于指明变量值不可被篡改(如const int foo)。
将const放在前面才更易读，因为在自然语言中形容词(const)是在名词(int)之前，如const int* foo;。

为类中的函数加上const限定符表明该函数不会修改类成员变量的状态(如 class Foo { int Bar(char c) const; };)。

---
宏名一律大写，单词之间用下划线连接，除非特定功能，一般情况下不建议使用宏。

---
应该尽量使用C++风格的类型转换符：

1. 用static_cast替代C风格的值转换,，或某个类指针需要明确的向上转换为父类指针时。
2. 用const_cast去掉const限定符。
3. 用reinterpret_cast指针类型和整型或其它指针之间进行不安全的相互转换，仅在你对所做一切了然于心时使用。
4. dynamic_cast在测试代码以外不要使用。除了测试代码，如果你需要在运行时确定类型信息，说明有设计缺陷。
