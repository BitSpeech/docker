---
title: 【Docker系列】Docker安装
tags:
  - docker
  - cloud
categories:
  - docker
  - tutorial
date: 2020-11-03 01:00:12
---






## Install Nvidia-docker 2.0

```
$ sudo yum install -y nvidia-docker2
$ sudo pkill -SIGHUP dockerd
```

To check installation:
```
$ docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
```



## reference

- https://github.com/keineahnung2345/Dockerfiles/blob/master/How%20to%20install%20Nvidia-Docker%202.0%20on%20CentOS%207.md
