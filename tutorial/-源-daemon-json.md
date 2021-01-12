---
categories:
  - docker
  - tutorial
abbrlink: '0'
---


## 背景


由于docker hub下载速度很慢，一个70M的镜像，要下载很久。

## 修改默认源

怎么修改拉取源从指定的国内仓库拉取镜像？


```
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://rgr5cdlp.mirror.aliyuncs.com"],
  "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
  }
}
EOF
```


## 新增insecure-registries

修改 /etc/docker/daemon.json，添加一行。
https://docs.docker.com/registry/insecure/

```
{
  "insecure-registries":["ai-image.jd.com"],
  "runtimes": {
  }
}  
```

然后
```
docker pull ai-image.jd.com/nlp/dnnlm:0.0.5
```



ss



```
systemctl daemon-reload
systemctl restart docker
```
