---
categories:
  - docker
  - tutorial
abbrlink: '0'
---


```sh
$ docker images
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running
```


启动docker服务

```sh
systemctl start docker
```

mac上没有systemctl这个命令

监听的端口
