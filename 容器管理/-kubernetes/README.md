---
title: 从docker compose到Kubernetes
---


以前Gemfield使用的是docker compose来管理容器，但最近的服务要scale到上百个container，并且要跨越多台机器，
很显然docker compose就无能为例了：比如如何进行跨越多台机器的增删改查，比如不同机器之间的container如何通信等等。
于是Gemfield开始使用K8s来进行容器的管理维护了。




## 参考

- https://zhuanlan.zhihu.com/p/41071320

