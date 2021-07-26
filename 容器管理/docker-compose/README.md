---
title: docker compose
categories:
  - docker
  - advanced
---


Compose 是用于定义和运行多容器 Docker 应用程序的工具。
通过 Compose，您可以使用 YML 文件来配置应用程序需要的所有服务。然后，使用一个命令，就可以从 YML 文件配置中创建并启动所有服务。


Compose 使用的三个步骤：

1. 使用 Dockerfile 定义应用程序的环境。
2. 使用 docker-compose.yml 定义构成应用程序的服务，这样它们可以在隔离环境中一起运行。
3. 最后，执行 docker-compose up 命令来启动并运行整个应用程序。


## 参考

- [官方教程](https://docs.docker.com/compose/gettingstarted/)
- [Docker Compose 网络设置](https://juejin.cn/post/6844903976534540296)
- [Docker Compose 网络设置 | 官网](https://docs.docker.com/compose/networking/)
- 示例：
  - django  https://yeasy.gitbook.io/docker_practice/compose/django
  - rails
  - wordpress

