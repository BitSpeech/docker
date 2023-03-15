---
title: 使用Macvlan网络联网 (给docker容器分配一个和宿主机处于同一网段的ip)
---



## 名字

mac: 为每个容器的虚拟网络接口分配MAC地址
vlan: 虚拟局域网，virtual local area network 

## 简介


bridge网络有一个问题，就是多个容器要同时对外暴露服务时，会竞争宿主机上面的端口，导致端口资紧张的情况发生。那么我们能不能给docker分配一个和宿主机处于同一个网段的ip，这样，外部网络就可以直接访问该容器了呢?答案当然是可以，我们现在就利用上面的知识，来更改一下docker的网络拓扑结构。



https://blog.51cto.com/u_15187242/2948696


某些应用程序，尤其是旧版应用程序或监视网络流量的应用程序，期望直接连接到物理网络。
在这种情况下，可以使用macvlan网络驱动程序为每个容器的虚拟网络接口分配MAC地址，
使其看起来像是直接连接到物理网络的物理网络接口。在这种情况下，您需要在Docker主机上指定用于的物理接口macvlan，
以及的子网和网关macvlan。您甚至可以macvlan使用不同的物理网络接口隔离网络。请记住以下几点：

由于IP地址耗尽或“ VLAN传播”，很容易无意间损坏您的网络，在这种情况下，您的网络中有大量不正确的唯一MAC地址。

您的网络设备需要能够处理“混杂模式”，在该模式下，可以为一个物理接口分配多个MAC地址。

如果您的应用程序可以使用网桥（在单个Docker主机上）或覆盖（跨多个Docker主机进行通信）工作，那么从长远来看，这些解决方案可能会更好。

创建一个macvlan网络
创建macvlan网络时，它可以处于桥接模式或802.1q中继桥接模式。

在桥接模式下，macvlan流量通过主机上的物理设备。

在802.1q中继桥接模式下，流量通过Docker动态创建的802.1q子接口。这使您可以更精细地控制路由和过滤。

## 先决条件

- 大多数云提供商阻止macvlan网络。您可能需要物理访问网络设备。
- macvlan网络驱动程序仅适用于Linux主机，而Mac的Docker桌面，Windows的Docker桌面或Windows Server的Docker EE不支持该网络驱动程序。
- 您至少需要3.9版的Linux内核，并建议使用4.0版或更高版本。
- 这些示例假定您的以太网接口是eth0。如果您的设备使用其他名称，请改用该名称。


## 桥接模式

要创建macvlan与给定物理网络接口桥接的网络，请--driver macvlan与docker network create命令一起使用。您还需要指定parent，这是流量将在Docker主机上实际通过的接口。

```
$ docker network create -d macvlan \
  --subnet=172.16.86.0/24 \
  --gateway=172.16.86.1 \
  -o parent=eth0 \
  my-macvlan-net
```

-d macvlan  加载kernel的模块名
--subnet 宿主机所在网段
--gateway 宿主机所在网段网关
-o parent 继承指定网段的网卡


您可以使用`docker network ls`和`docker network inspect my-macvlan-net` 命令来验证网络是否存在并且是macvlan网络。


如果您需要排除IP地址在macvlan网络中的使用，例如当一个给定的IP地址已经在使用中时，请使用--aux-addresses：

```
$ docker network create -d macvlan \
  --subnet=192.168.32.0/24 \
  --ip-range=192.168.32.128/25 \
  --gateway=192.168.32.254 \
  --aux-address="my-router=192.168.32.129" \
  -o parent=eth0 macnet32
```

## 启动一个alpine容器并将其附加到my-macvlan-net网络。这些 -dit标志在后台启动容器，但允许您附加到它。该--rm标志表示容器在停止时被移走。

```
$ docker run --rm -dit \
  --network my-macvlan-net \
  --name my-macvlan-alpine \
  alpine:latest \
  ash
```

疑问， 不指定ip的话，会和宿主机ip重复吗？？


## 802.1q中继桥接模式
如果您指定parent带有点的接口名称，例如eth0.50，则Docker会将其解释为的子接口，eth0并自动创建该子接口。

```
$ docker network create -d macvlan \
    --subnet=192.168.50.0/24 \
    --gateway=192.168.50.1 \
    -o parent=eth0.50 \
    macvlan50
```

## 使用ipvlan而不是macvlan

在上面的示例中，您仍在使用L3桥。您可以改用ipvlan L2桥接器。指定-o ipvlan_mode=l2。

```
$ docker network create -d ipvlan \
    --subnet=192.168.210.0/24 \
    --subnet=192.168.212.0/24 \
    --gateway=192.168.210.254 \
    --gateway=192.168.212.254 \
     -o ipvlan_mode=l2 -o parent=eth0 ipvlan210
```

## 使用IPv6

如果已将Docker守护程序配置为允许IPv6，则可以使用双栈IPv4 / IPv6macvlan网络。

$ docker network create -d macvlan \
    --subnet=192.168.216.0/24 --subnet=192.168.218.0/24 \
    --gateway=192.168.216.1 --gateway=192.168.218.1 \
    --subnet=2001:db8:abc8::/64 --gateway=2001:db8:abc8::10 \
     -o parent=eth0.218 \
     -o macvlan_mode=bridge macvlan216


## 

```
docker run --net=mynet --ip=192.168.209.152  -it --rm centos /bin/bash
```


## 参考

- https://dockerdocs.cn/network/macvlan/
- https://dockerdocs.cn/network/network-tutorial-macvlan/index.html
- 