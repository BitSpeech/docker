---
title: docker中的权限
---

# docker 客户端

```
$ ls -lh /usr/bin/docker
-rwxr-xr-x 1 root root 37M Apr 26 15:18 /usr/bin/docker
```
默认所有用户都能够执行docker命令，但是执行其他命令，会出现权限问题。


# docker 服务

```sh
$ docker images
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.37/images/json: dial unix /var/run/docker.sock: connect: permission denied
```

执行查询镜像命令，报错。因为该用户不在docker用户组。而只有docker用户组才有权限访问docker server。

```sh
$ cd /var/run/
$ ls -lh | grep docker
drwx------  9 root  root    200 Jul  7 11:03 docker
-rw-r--r--  1 root  root      4 Jul  6 14:33 docker.pid
srw-rw----  1 root  docker    0 Jul  6 14:32 docker.sock   # docker server
```

docker.sock属于docker用户组。




```sh
$ cat /etc/group | grep docker
docker:x:999:song.xu01
```





## 添加权限

```sh
$ usermod -aG docker 用户名 # 添加到docker用户组
```
