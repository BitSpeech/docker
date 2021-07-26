---
title: docker 常见的网络问题
---

容器内不能联网



在构建镜像时，在命令最后带上--network host即可。
```
docker build -t <镜像名> . --network host
```


运行时网络配置
```
docker run  --net=host
```




## DNS问题

容器内不能正常域名解析


### 策略1：--net=host

ip能连通，域名不通

### 策略2： /etc/docker/deamon.json


查看本机DNS
```sh
nmcli dev show | grep 'IP4.DNS'
```

修改`/etc/docker/deamon.json`的dns配置
```yaml
{
"dns": ["192.168.0.1", "8.8.8.8"]
}
```

我的配置
```
{
  "insecure-registries":["ai-image.jd.com", "idockerhub.jd.com", "dockerhub.jd.com"],
  "runtimes": {
  },
  "dns": ["10.16.16.16", "172.16.16.16", "103.224.222.222", "8.8.8.8"]
}

```



重启docker服务
```sh
sudo service docker restart
```

https://github.com/gliderlabs/docker-alpine/issues/386#issuecomment-437698540



## 网络连接问题

ip不通



## 代理



