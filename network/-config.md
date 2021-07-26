---
title: docker常用网络命令
---



##

在我们安装docker的过程中，docker会自动创建三个网络模式，通过下面的命令即可看到：
docker network ls
输出结果如下所示：
```
 docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
cd5128f9d0eb        bridge              bridge              local
436134e82099        host                host                local
02e34c74c2a7        none                null                local
```


在启动容器的时候，我们可以通过 –net 参数来指定使用哪种网络模式，默认docker容器会使用 bridge 网络模式
通过下面的几个命令，我们可以查看每一种网络往事的详细信息：

查看 bridge 网络模式详情
```
docker network inspect bridge
```

查看 host 网络模式详情
```
docker network inspect host
```

查看 none 网络模式详情
```
docker network inspect none
```