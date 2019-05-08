# shell字符串比较


```
OS="ubuntu"

if [ "${OS}"x = "ubuntu"x ]; then
    echo "ubuntu"
elif [ "${OS}"x = "centos"x ]; then
    echo "centos"
else
    echo "not supported os: " ${OS}
fi
```