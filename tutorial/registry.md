

参考 https://blog.csdn.net/M2l0ZgSsVc7r69eFdTj/article/details/78538819



docker build -f tensor2tensor-1.6.6  . -t bitspeech/tensor2tensor:1.6.6



# 自动化构建



除了在本地创建镜像然后使用push命令将其推送到Docker Hub之外，我们还可以使用Docker Hub提供的自动化构建技术在服务端直接构建镜像。通过在Docker Hub连接一个包含Dockerfile文件的Git Hub或Bit Bucket的仓库， Docker Hub的构建集群服务器就会自动构建镜像。通过这种方式构建出来的镜像会被标记为Automated Build，也可以称为受信构建（Trusted Build）。
