---
title: Docker的网络模型
---

当 Docker 启动时，会自动在主机上创建一个 docker0 虚拟网桥，
实际上是 Linux 的一个 bridge，可以理解为一个软件交换机。它会在挂载到它的网口之间进行转发。





## 网络驱动

Docker的网络子系统可使用驱动程序插入。默认情况下，有几个驱动程序，它们提供核心联网功能：


| 网络模式 | 配置 | 详细说明 | 应用场景 |  |  |
|---|---|---|---|---|---|
| bridge | –net=bridge | 默认的网络驱动程序。如果您未指定驱动程序，则这是您正在创建的网络类型。当您的应用程序在需要通信的独立容器中运行时，通常会使用网桥网络。 |  |  |  |
| host | –net=host | 对于独立容器，请删除容器与Docker主机之间的网络隔离，然后直接使用主机的网络。请参阅 使用主机网络。 |  |  |  |
| overlay | 无 | 覆盖网络将多个Docker守护程序连接在一起，并使群集服务能够相互通信。您还可以使用覆盖网络来促进群集服务和独立容器之间或不同Docker守护程序上的两个独立容器之间的通信。这种策略消除了在这些容器之间进行操作系统级路由的需要。 |  |  |  |
| macvlan | 无 | Macvlan网络允许您为容器分配MAC地址，使其在网络上显示为物理设备。Docker守护程序通过其MAC地址将流量路由到容器。macvlan 在处理希望直接连接到物理网络而不是通过Docker主机的网络堆栈进行路由的旧应用程序时，使用驱动程序有时是最佳选择。 |  |  |  |
| none | -net=none | 容器有独立的Network namespace，并没有对其进行任何网络设置，如分配veth pair和网桥连接，配置IP等。该模式关闭了容器的网络功能。 |  |  |  |
| container | -net=container:NAME_or_ID | 容器和另外一个容器共享Network namespace。kubernetes中的pod就是多个容器共享一个Network namespace。创建的容器不会创建自己的网卡，配置自己的 IP， 而是和一个指定的容器共享IP、端口范围。 |  |  |  |



docker容器的网络有五种模式：

1）bridge模式，--net=bridge(默认)

这是dokcer网络的默认设置，为容器创建独立的网络命名空间，容器具有独立的网卡等所有单独的网络栈，是最常用的使用方式。

在docker run启动容器的时候，如果不加--net参数，就默认采用这种网络模式。安装完docker，系统会自动添加一个供docker使用的网桥docker0，我们创建一个新的容器时，

容器通过DHCP获取一个与docker0同网段的IP地址，并默认连接到docker0网桥，以此实现容器与宿主机的网络互通。



2）host模式，--net=host

这个模式下创建出来的容器，直接使用容器宿主机的网络命名空间。

将不拥有自己独立的Network Namespace，即没有独立的网络环境。它使用宿主机的ip和端口。



3）none模式，--net=none

为容器创建独立网络命名空间，但不为它做任何网络配置，容器中只有lo，用户可以在此基础上，对容器网络做任意定制。

这个模式下，dokcer不为容器进行任何网络配置。需要我们自己为容器添加网卡，配置IP。

因此，若想使用pipework配置docker容器的ip地址，必须要在none模式下才可以。



4）其他容器模式（即container模式），--net=container:NAME_or_ID

与host模式类似，只是容器将与指定的容器共享网络命名空间。

这个模式就是指定一个已有的容器，共享该容器的IP和端口。除了网络方面两个容器共享，其他的如文件系统，进程等还是隔离开的。



5）用户自定义：docker 1.9版本以后新增的特性，允许容器使用第三方的网络实现或者创建单独的bridge网络，提供网络隔离能力。








## 查看

在我们安装docker的过程中，docker会自动创建三个网络模式，通过下面的命令即可看到：
docker network ls
输出结果如下所示：
```
 docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
cd5128f9d0eb        bridge              bridge              local
436134e82099        host                host                local
02e34c74c2a7        none                null                local
```


在启动容器的时候，我们可以通过 –net 参数来指定使用哪种网络模式，默认docker容器会使用 bridge 网络模式
通过下面的几个命令，我们可以查看每一种网络往事的详细信息：

查看 bridge 网络模式详情
```
docker network inspect bridge
```

查看 host 网络模式详情
```
docker network inspect host
```

查看 none 网络模式详情
```
docker network inspect none
```






## 参考

- 官方文档：https://docs.docker.com/network/
- 中文文档：https://dockerdocs.cn/network
- 全网最详细的Docker网络教程详解 https://juejin.cn/post/7041923410649153543