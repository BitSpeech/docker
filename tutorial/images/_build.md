---
title: Docker镜像的构建
categories:
  - CS
  - cloud
  - docker
  - tutorial
  - images
date: 2018-01-01 00:00:00
---


# 如何创建docker镜像

### 直接pull

从Docker Hub下拉

现在docker官方共有仓库里面有大量的镜像，所以最基础的镜像，我们可以在共有仓库直接拉取，因为这些镜像都是原厂维护，可以得到即使的更新和修护。


### Dockerfile：

我们如果想去定制这些镜像，我们可以去编写Dockerfile，然后重新bulid，最后把它打包成一个镜像，这种方式是最为推荐的方式包括我们以后去企业当中去实践应用的时候也是推荐这种方式。

### Commit

当然还有另外一种方式，就是通过镜像启动一个容器，然后进行操作，最终通过commit这个命令commit一个镜像，但是不推荐这种方式，虽然说通过commit这个命令像是操作虚拟机的模式，但是容器毕竟是容器，它不是虚拟机，所以大家还是要去适应用Dockerfile去定制这些镜像这种习惯。

镜像的概念主要就是把把运行环境和业务代码进行镜像的打包，我们这个课重点是了解镜像的分层技术，我们先来看一个Ubuntu系统的镜像。


# build images

## 从文件进行build


```sh
docker build -f dockerfile . -t bitspeech/tensor2tensor:1.9.0-gpu
```



## 构建小容量Docker镜像的技巧

- 使用较小的基础镜像
  - centos:7的大小就比ubuntu:14.04要大，而ubuntu:14.04比debian:jessie要大。
- 安装完成后进行清理
- apt 安装，编译，remove 要一气呵成。docker 镜像是 git 的机制，安装和移除必须写在一行。

你可以通过移除软件包和清理垃圾文件来减小镜像的大小。例如使用apt包管理器的系统可以通过`apt-get purge`，`apt-get autoremove`，及`apt-get clean`命令移除软件包，使用`rm -rf /var/lib/apt/lists/*`及`rm -rf /tmp`清除一些临时文件。
这里需要注意的是，因为Docker的层次系统，Dockerfile中的每一个RUN命令都会创建一个新的copy-on-write层，从而**增加了最终镜像的大小，即使是通过RUN指令运行移除文件的命令**。所以上面的这些命令如果都单独地以Dockerfile中的RUN指令执行，最终的镜像大小不会减小，反而会增加。这就需要我们下面的对Dockerfile的进一步改进。






1.系统级镜像:如Ubuntu镜像，CentOS镜像以及Debian容器等；

2.工具栈镜像:如Golang镜像，Flask镜像，Tomcat镜像等；

3.服务级镜像:如MySQL镜像，MongoDB镜像，RabbitMQ镜像等；

4.应用级镜像:如WordPress镜像，DockerRegistry镜像等。









# 参考

- [Docker镜像分层技术 | 麦子学院](http://www.maiziedu.com/wiki/cloud/dockerimage/)
- [深刻理解Docker镜像大小](https://blog.csdn.net/shlazww/article/details/47375009)
- [构建小容量Docker镜像的技巧](https://andyyoung01.github.io/2016/08/26/%E6%9E%84%E5%BB%BA%E5%B0%8F%E5%AE%B9%E9%87%8FDocker%E9%95%9C%E5%83%8F%E7%9A%84%E6%8A%80%E5%B7%A7/)
