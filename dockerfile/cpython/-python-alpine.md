---
title: python:3.7-alpine镜像
---

## python:3.7-alpine





Alpine 操作系统是一个面向安全的轻型 Linux 发行版。它不同于通常 Linux 发行版，
Alpine 采用了 musl libc 和 busybox 以减小系统的体积和运行时资源消耗，但功能上比 busybox 又完善的多，因此得到开源社区越来越多的青睐。


python-alpine是一个极简的镜像，只有6.5M左右，但在选择使用时会产生比较多的问题，
所以如果系统存储够用或者公司对镜像大小没有限制的话，还是建议使用比较完整的镜像来跑程序，这样会省事很多。

https://yeasy.gitbook.io/docker_practice/os/alpine



## 常见示例

```
FROM alpine
RUN apk add --update gcc
```

```
FROM python:3.7-alpine
RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip install **
```

## 启动容器

没有bash，有sh。

启动容器
```sh
docker run -it python:3.7-alpine sh
```




## busybox


很神奇，所有命令都指向`/bin/busybox`。

BusyBox 是一个集成了一百多个最常用 Linux 命令和工具（如 cat、echo、grep、mount、telnet 等）的精简工具箱，
它只需要几 MB 的大小，很方便进行各种快速验证，被誉为“Linux 系统的瑞士军刀”。

https://yeasy.gitbook.io/docker_practice/os/busybox



```sh
$ cd /bin/
$ ls -l
lrwxrwxrwx    1 root     root            12 Jun 15 14:34 arch -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 15 14:34 ash -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 29 21:08 base64 -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 15 14:34 bbconfig -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 29 21:08 cat -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 29 21:08 chgrp -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 29 21:08 chmod -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 29 21:08 chown -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 29 21:08 cp -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 15 14:34 sh -> /bin/busybox
...


$ /bin/busybox
BusyBox v1.33.1 () multi-call binary.
BusyBox is copyrighted by many authors between 1998-2015.
Licensed under GPLv2. See source distribution for detailed
copyright notices.

Usage: busybox [function [arguments]...]
   or: busybox --list[-full]
   or: busybox --install [-s] [DIR]
   or: function [arguments]...

        BusyBox is a multi-call binary that combines many common Unix
        utilities into a single executable.  Most people will create a
        link to busybox for each function they wish to use and BusyBox
        will act like whatever it was invoked as.

Currently defined functions:
        [, [[, acpid, add-shell, addgroup, adduser, adjtimex, arch, arp, arping, ash, awk, base64, basename, bbconfig, bc, beep, blkdiscard, blkid, blockdev, brctl, bunzip2, bzcat, bzip2, cal, ...
```



## 参考

- [用 Alpine 会让 Python Docker 的构建慢 50 倍](https://www.infoq.cn/article/vodle9fsibkqdlcxjzzj)
- [还在用Alpine作为你Docker的Python开发基础镜像？其实Ubuntu更好一点](https://v3u.cn/a_id_173)