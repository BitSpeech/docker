---
title: 定制带 Python3 的 Ubuntu 基础 Docker 镜像
---


python官方未提供python的ubuntu镜像，



```
FROM daocloud.io/ubuntu:trusty
MAINTAINER water-law <dockerwaterlaw@daocloud.io>
RUN apt-get update && \
    apt-get install -y python3 \
                        python3-dev \
                        python3-pip \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*
    
RUN mkdir -p /app
WORKDIR /app
EXPOSE 80
CMD ["bash"]
```