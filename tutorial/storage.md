---
title: docker的存储
---


# 简介

https://docs.docker.com/storage/storagedriver/


每个Docker镜像（Image）都引用了一些只读的（read-only）层（layer），不同的文件系统layer也不同。这些layer堆叠在一起构成了容器（Container）的根文件系统（root filesystem）。


当你基于Ubuntu 创建一个新的容器的时候，你其实只是在它的上层又增加了一个新的、薄的、可写层。这个新增的可写层称为容器层（container layer）。当这个新的容器运行时，所有的改动（比如创建新文件、修改已有文件、删除文件等）都会写到这一层。


## 存储 - 镜像层(Layers)

镜像层依赖于一系列的底层技术，比如文件系统(filesystems)、写时复制(copy-on-write)、联合挂载(union mounts)等

![20161027203243](/uploads/86224eb33527e33bfa0ee5ba70416428/20161027203243.jpg)

容器层是可写层。

例如：
`docker history  tensorflow/tensorflow:1.8.0-gpu`

![Picture1](/uploads/091cf3833ef1eda26489369a283df22c/Picture1.png)

- [tensorflow镜像](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.gpu)
- [nvidia-cuda镜像](https://gitlab.com/nvidia/cuda/blob/ubuntu16.04/9.0/base/Dockerfile)
- [ubuntu镜像](https://github.com/tianon/docker-brew-ubuntu-core/blob/58cc180042b7ebec2b683576faa00c04d5d011e2/xenial/Dockerfile)


# 写时拷贝策略(CopyOnWrite)


CopyOnWrite容器即写时复制的容器。通俗的理解是当我们往一个容器添加元素的时候，不直接往当前容器添加，而是**先将当前容器进行Copy，复制出一个新的容器，然后新的容器里添加元素，之后再将原容器的引用指向新的容器**。这样做的好处是我们可以对CopyOnWrite容器进行**并发的读，而不需要加锁**，因为当前容器不会添加任何元素。所以CopyOnWrite容器也是一种**读写分离**的思想，读和写不同的容器。


**缺点**
- 内存占用问题：<br>在进行写操作的时候，内存里会同时驻扎两个对象的内存，**旧的对象**和**新写入的对象**（注意:在复制的时候只是复制容器里的引用，只是在写的时候会创建新对象添加到新容器里，而旧容器的对象还在使用，所以有两份对象内存）。 <br> docker的什么操作会写容器？不涉及文件写操作的会涉及到容器的写操作吗？只有commit操作会写操作？
- 数据一致性问题


## COW的应用

CopyOnWrite容器非常有用，可以在非常多的并发场景中使用到。

### COW在java

从JDK1.5开始Java并发包里提供了两个使用CopyOnWrite机制实现的并发容器,它们是CopyOnWriteArrayList和CopyOnWriteArraySet

### COW在C++

C++的STL中，曾经也有过Copy-On-Write的玩法，参见陈皓的《C++ STL String类中的Copy-On-Write》，后来，因为有很多线程安全上的事，就被去掉了。


# 数据持久化




# 参考

- [JAVA中的COPYONWRITE容器](https://coolshell.cn/articles/11175.html)
