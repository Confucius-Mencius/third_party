假设192.168.2.16是third_party的编译机器，已经在192.168.2.16上编译好了公用的third_party库，编辑/etc/exports，增加一行：

	/opt/third_party *(ro)  # 只读
或者

	/opt/third_party *(rw)  # 读写，注意设置目录本身为可写的。

**一般设置只读即可。**

使配置生效：exportfs -r

在192.168.2.16上启动nfs服务，命令如下：

    service rpcbind start
    service nfs start
或者

    sudo /etc/init.d/rpcbind restart
    sudo /etc/init.d/nfs restart

**需要安装nfs-utils和rpcbind两个包。**

nfs服务设为开机启动：

    chkconfig rpcbind on
    chkconfig nfs on

在自己的开发机上安装nfs-utils，然后只需mount即可使用，命令如下：

    sudo yum install -y nfs-utils
    cd /opt
    sudo mkdir third_party
    sudo mkdir common_component

    mount -t nfs -o ro 192.168.2.16:/opt/third_party third_party
    mount -t nfs -o ro 192.168.2.16:/opt/common_component common_component

查看已挂载：mount -l

客户端开机自动mount：
vi /etc/fstab加入以下两行：

    192.168.2.16:/opt/third_party /opt/third_party nfs  defaults 0 0
    192.168.2.16:/opt/common_component /opt/common_component nfs  defaults 0 0
