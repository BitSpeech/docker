---
title: Docker镜像分层技术
categories:
  - docker
  - tutorial
  - images
abbrlink: 229a050
date: 2018-01-01 00:00:00
---



# 简介

采用的sha256对每层编码。对image进行编码。


Docker对于镜像的维护类似于git对于repository的维护，都是只记录增量的。原有镜像是静态文件，基于这个静态文件可以创建的一个动态容器，在这个动态的容器中做任何你希望做的修改，然后退出容器后使用commit生成新的镜像，这个新的镜像就保留了你做的改动，从而生成新的一层。  未改变的文件还是使用原有镜像的文件，  被改动的文件作为新的layer被保存。基于同一个base image构建的两个不同的镜像，就类似于 基于同一个repository创建的两个不同的branch， 未修改的文件由两个镜像公用，每个镜像又独自保留他们特定的修改内容的增量。

从命令行上来说：
- 一个commit指令对应一个新的layer
- 一条RUN语句对应一个新的layer


# Ubuntu系统的镜像







# 参考


-
