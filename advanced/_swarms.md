---
title: swarms
categories:
  - CS
  - cloud
  - docker
  - tutorial
---






Docker Swarm是docker原生的集群管理工具，之前是个独立的项目，于 Docker 1.12 被整合到 Docker Engine 中,作为swarm model存在，因此Docker Swarm实际上有两种：独立的swarm和整合后swarm model。官方显然推荐后者，本文也使用swarm model。相较于kubernetes，Mesos等工具，swarm最大的优势是轻量，原生和易于配置。它使得原本单主机的应用可以方便地部署到集群中。


使用它，用户可以将多个 Docker 主机封装为单个大型的虚拟 Docker 主机，快速打造一套容器云平台。
