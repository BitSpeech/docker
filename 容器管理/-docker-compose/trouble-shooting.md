---
title: docker compose常见问题
---




## unknown flag: --profile

```
$ docker compose --profile ci up --build --attach-dependencies
unknown flag: --profile
See 'docker --help'.
```



策略： 升级docker客户端

```
yum install  docker-ce-cli
```

更多，参考：https://www.runoob.com/docker/centos-docker-install.html

## ss

ss


