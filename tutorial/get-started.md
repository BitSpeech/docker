---
title: 【Docker系列】Docker入门教程
tags:
  - docker
  - cloud
categories:
  - '-docker'
  - tutorial
date: 2018-07-21 00:00:00
---

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

1. [环境配置的难题](#环境配置的难题)
1. [简介 & 简单原理](#简介-简单原理)
	1. [Docker concepts](#docker-concepts)
1. [基本操作](#基本操作)
	1. [关于镜像的基本操作](#关于镜像的基本操作)
	1. [关于容器的基本操作](#关于容器的基本操作)
	1. [使用建议](#使用建议)
1. [定制自己的镜像 - Dockerfile](#定制自己的镜像-dockerfile)
	1. [自己写dockerfile](#自己写dockerfile)
	1. [build images](#build-images)
	1. [docker镜像升级](#docker镜像升级)
	1. [Dockerfile 优化](#dockerfile-优化)
1. [练习](#练习)
	1. [关于镜像的操作](#关于镜像的操作)
	1. [关于容器的基本操作](#关于容器的基本操作)
	1. [Dockerfile相关](#dockerfile相关)
	1. [思考题](#思考题)
1. [扩展阅读](#扩展阅读)

<!-- /TOC -->



# 环境配置的难题

如果你正好是一个运维工程师而且你正感觉你的运维**环境一团糟**，麻烦请你思考一下这是为什么？你是不是正在运维着一个使用 php、java、C#甚至 C/C++等用各种语言编写的应用都在运行的环境里？这个环境是不是因为某种历史原因，使你的操作系统运行着各个版本的内核甚至还有 windows？即使是同样语言编写的业务也运行着**不同版本的库**？你的整个系统环境是不是甚至找不出来两台硬件、操作系统、库版本以及语言版本完全一样的环境？于是你每次遇到问题都要去排查到底那个坑到底在那里？从网络、内核到应用逻辑。你每次遇到产品升级都要在各种环境上做稳定性测试，发现不同的环境代码 crash 的原因都不尽相同。你就像一个老中医一样去经历各种疑难杂症，如果遇到问题能找到原因甚至都是幸运的，绝大多数情况是解决了但不知道原因和没解决自动好了也不知道原因。于是你们在一个特定的公司的环境中积累着“经验”，成为你们组新手眼中的大神，凭借历经故障养成的条件反射在快速解决不断发生的重复问题，并故弄玄虚的说：这就是工作经验。因为经验经常是搞不清楚原因时的最后一个遮羞布。当别人抱怨你们部门效率低的时候，你一般的反应是：”you can you up，no can no 逼逼！“

> 来自知乎


# 简介 & 简单原理

![](https://assets.gitlab-static.net/uploads/-/system/project/avatar/3846659/vertical_large.png)

- 可重复
- 可移植。镜像应该可以运行在任何主机上并且运行尽可能多的次数。

用了 Docker，就像世界出现了集装箱，这样你的业务就可以随意的、无拘无束的运行在任何地方。

Docker 公司的口号：Build，Ship，and Run Any App，Anywhere。大概意思就是编译好一个应用后，可以在任何地方运行，不会像传统的程序一样，一旦换了运行环境，往往就会出现缺这个库，少那个包的问题。



## Docker concepts

- **镜像**（Image）：Docker 把应用程序及其依赖，打包在 image 文件里面
- **容器**（Container）: 镜像本身是只读的，容器从镜像启动时，Docker在镜像的上层创建一个可写层，镜像本身不变。同一个 image 文件，可以生成多个同时运行的容器实例。
- **注册服务器**（Registry）: 存放实际的镜像的地方，比如Docker的官方仓库[Docker Hub](https://hub.docker.com/)、[Docker Store](https://store.docker.com/)
- **仓库**（Repository）: 仓库是存放一组关联镜像的集合，比如同一个应用的不同版本的镜像。比如[tensorflow](https://hub.docker.com/r/tensorflow/tensorflow/tags/)




# 基本操作

## 关于镜像的基本操作


```sh
docker images          # 列出本机所有的docker镜像
docker inspect img_id  # 查看镜像详细信息
docker history img_id  # 查看镜像分层
docker rmi img_id      # 删除镜像
docker rmi -f $(docker images -q)  # 删除所有镜像
docker pull repository:tag    # 拉取镜像，类似 git pull
docker push repository:tag    # 上传镜像，类似git push


```

## 关于容器的基本操作

```sh
# 1. 基于镜像启动一个容器
NAME=name_test           # 命名你的容器，姓名_任务_其他
PROJECT_DIR=`pwd`/tutorial
nvidia-docker run -it \
  --name $NAME \
  -v $PROJECT_DIR:/root/  \
  tensorflow/tensorflow:latest-gpu bash


# 2. 运行程序
cd /root
export CUDA_VISIBLE_DEVICES=   # 只占用cpu
python convolutional.py
# 3. 退出容器
ctrl+p+q    # 临时退出容器而不终止它 (不关闭bash进程)
# ctrl+d    # 退出shell，退出容器
# 4. 查看所有正在运行的容器，并通过name找到你运行的容器
docker ps
# 5. 查看运行日志
docker logs container_id
# 6. 重新进入容器
docker attach container_id         # 进入同一个bash
# 或者
docker exec -it container_id bash  # 重新创建一个bash
# 7. 删除容器
docker rm container_id
# 8. 删除所有容器
docker rm -f $(docker ps -a -q)
```



**注意**：
- `attach` 与 `exec`的区别
- `ctrl+p+q` 与 `ctrl+d`的区别

## 使用建议

- 合理命名镜像和容器
- 少用port
- 不要把频繁更新的项目打入镜像
- 不用的镜像及时删除
- 不用的容器及时退出

**扩展阅读**

- [操作 Docker 容器 | Docker从入门到实践](https://yeasy.gitbooks.io/docker_practice/container/)


# 定制自己的镜像 - Dockerfile


## 自己写dockerfile

- **FROM**: 指定基础镜像
- **MAINTAINER**：用来指定维护者的姓名和联系方式
- **ENV**: 设置环境变量
- **RUN**：在shell或者exec的环境下执行的命令。RUN指令会在新创建的镜像上添加新的层
- **EXPOSE**: 指定容器在运行时监听的端口
- **COPY**:
- **VOLUME**: 授权访问从容器内到主机上的目录。用于containers之间共享数据
- **WORKDIR**: 指定RUN、CMD与ENTRYPOINT命令的工作目录。
- **ENTRYPOINT**:
- **CMD**: 提供了容器默认的执行命令

**注意**

- `CMD`与 `ENTRYPOINT` 的区别：
  - `CMD`不能接受参数，运行时可被覆盖；
  - `ENTRYPOINT`能够接收参数，运行时不可被覆盖
- `COPY`与映射`-v`的区别

[示例dockerfile](dockerfile/dockerfile.tf1.8-t2t1.6)


## build images

从文件进行build
```sh
docker build -f dockerfile . -t tensorflow/t2t:nmt
```
或 从标准输入中读取 Dockerfile 进行构建
```sh
cat dockerfile | docker build -
```


## docker镜像升级

- 更改 & commit的方式   (不推荐)
- 更改`dockerfile`，重新build镜像   (推荐)


## Dockerfile 优化


- `apt-get install`之前先`apt-get update`
- 尽量选取满足需求但较小的基础系统镜像，建议选择debian:wheezy镜像，仅有86MB大小
- 清理编译生成文件、安装包的缓存等临时文件
- 安装各个软件时候要指定准确的版本号，并避免引入不需要的依赖
- 从安全的角度考虑，应用尽量使用系统的库和依赖
- 使用Dockerfile创建镜像时候要添加.dockerignore文件或使用干净的工作目录

**扩展阅读**:
- [Best practices for writing Dockerfiles | 官网](https://docs.docker.com/develop/develop-images/dockerfile_best-practices)


# 练习

登录服务器`ssh docker1@**.**.**.12`

## 关于镜像的操作

[参考上文↑](#关于镜像的基本操作)


## 关于容器的基本操作

1. 从已有docker启动容器，参考
https://hub.docker.com/r/tensorflow/tensorflow/
1. 从bash启动容器，[参考上文↑](#关于容器的基本操作)


optinal:
- **httpd**: 利用docker搭一个http server
- **gitlab**: 利用docker搭一个gitlab server
- **kaldi**: 利用docker跑kaldi
- **pytorch**: 利用docker跑pytorch


## Dockerfile相关

1. 找到`tensorflow`的dockerfile，并参考
1. 找到`nvidia/cuda`的dockerfile，并参考
1. 自己根据需求，修改dockerfile，build image

## 思考题

1. 卸载 + commit 操作，镜像会变小吗？
1. `run yum clean cache`这样写dockerfile镜像会变小吗？
1. 可以在一个容器中同时运行多个应用进程吗？
1. Docker运行时内部删除的文件，如何恢复？
1. `RUN rm -rf somefile ` 镜像会减小吗？[示例](https://github.com/tianon/docker-brew-ubuntu-core/blob/58cc180042b7ebec2b683576faa00c04d5d011e2/xenial/Dockerfile#L36)

# 扩展阅读

- [什么是 Docker ？ | 腾讯云社区 ](https://cloud.tencent.com/developer/article/1005172)
- [Docker 入门教程 | 阮一峰](http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)
- [docker practice](https://yeasy.gitbooks.io/docker_practice/)
