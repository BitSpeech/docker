---
title: 容器管理，Docker、Docker-Compose、Swarm、k8s的演变
categories:
  - docker
  - advanced
---




## Docker vs 虚拟机

Docker 这个东西所扮演的角色，容易理解，它是一个容器引擎，也就是说实际上我们的容器最终是由Docker创建，运行在Docker中，其他相关的容器技术都是以Docker为基础，它是我们使用其他容器技术的核心。


## 容器管理

容器化的盛行，也带来了新的问题，那就是如何高效地去部署和管理这些镜像呢？因为比较大型的应用服务，往往需要多个组件一起合作才能正常运行，这就给单docker容器部署提出了挑战，Docker-Compose就像下面这只八爪章鱼，可以同时进行多容器的构建以及部署运行。




### Docker-Compose

Docker-Compose 是用来管理你的容器的，有点像一个容器的管家，想象一下当你的Docker中有成百上千的容器需要启动，如果一个一个的启动那得多费时间。有了Docker-Compose你只需要编写一个文件，在这个文件里面声明好要启动的容器，配置一些参数，执行一下这个文件，Docker就会按照你声明的配置去把所有的容器启动起来，只需docker-compose up即可启动所有的容器，但是Docker-Compose只能管理当前主机上的Docker，也就是说不能去启动其他主机上的Docker容器

### Docker Swarm

Docker Swarm 是一款用来管理多主机上的Docker容器的工具，可以负责帮你启动容器，监控容器状态，如果容器的状态不正常它会帮你重新帮你启动一个新的容器，来提供服务，同时也提供服务之间的负载均衡，而这些东西Docker-Compose 是做不到的。

但是Google接着开源了其内部用了很久的容器治理编排工具Kubernetes，以其高效以及智能自动化的管理机制，
吸引了大批开源开发者以及公司的青睐，从此一战成名，Docker Swarm的市场份额进一步低迷。




### Kubernetes

Kubernetes它本身的角色定位是和Docker Swarm 是一样的，也就是说他们负责的工作在容器领域来说是相同的部分，都是一个跨主机的容器管理平台，当然也有自己一些不一样的特点，k8s是谷歌公司根据自身的多年的运维经验研发的一款容器管理平台。而Docker Swarm则是由Docker 公司研发的。

既然这两个东西是一样的，那就面临选择的问题，应该学习哪一个技术呢?实际上这两年Kubernetes已经成为了很多大公司的默认使用的容器管理技术，而Docker Swarm已经在这场与Kubernetes竞争中已经逐渐失势，如今容器管理领域已经开始已经逐渐被Kubernetes一统天下了。所以建议大家学习的时候，应该多考虑一下这门技术在行业里面是不是有很多人在使用。

需要注意的是，虽然Docker Swarm在与Kubernetes的竞争中败下阵来，但是这个跟Docker这个容器引擎没有太大关系，它还是整个容器领域技术的基石，Kubernetes离开他什么也不是。

## 总结

Docker是容器技术的核心、基础。
Docker Compose是一个基于Docker的**单主机**容器编排工具，而k8s是一个跨主机的**集群**部署工具。
Docker Compose功能并不像Docker Swarm和Kubernetes是基于Dcoker的跨主机的容器管理平台那么丰富。


# 扩展阅读

- http://wudaijun.com/2018/03/docker-container-ops/
- https://www.jianshu.com/p/2a9ae69c337d
- https://juejin.cn/post/6844904046025768974
- https://qastack.cn/programming/47536536/whats-the-difference-between-docker-compose-and-kubernetes
