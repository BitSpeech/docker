# ==================================================================
# build & run
# rasa_version=1.9.5-full
# rasa_version=2.8.22-full
# rasa_version=latest-full 
# docker build -t  bitspeech/rasa:${rasa_version} -f Dockerfile .

# docker run --entrypoint bash -it -v $(pwd):/app bitspeech/rasa:${rasa_version}
# docker run --entrypoint bash -it -v $(pwd):/app -p 443:22 -p 8088:8088 bitspeech/rasa:${rasa_version}

# docker run --entrypoint bash -it -v $(pwd):/app --user $(id -u ${USER}):$(id -g ${USER}) bitspeech/rasa:latest 
# docker run --entrypoint bash -it -v $(pwd):/app -u $(id -u):$(id -g) bitspeech/rasa:latest 
#
# 参考： 
# - https://github.com/RasaHQ/rasa/blob/main/Dockerfile 
# - https://github.com/RasaHQ/rasa/blob/main/docker/Dockerfile.full
# ==================================================================

# full 比 base 多了 mitie
# FROm rasa/rasa:1.9.5-full
# FROM rasa/rasa:2.8.22-full
FROM rasa/rasa:latest-full


# 以下影响到print的默认编码和解码(如果默认gbk，print可能会出现 gbk codec can't encode charactor **)
ENV PYTHONIOENCODING UTF-8
# 以下影响到open的默认编码，影响vim打开的默认编码
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# 以 root 执行的脚本
USER root

COPY config-mirror-for-debian.sh /home/
RUN bash /home/config-mirror-for-debian.sh

# ========================安装依赖===============================
RUN apt-get update && apt-get install -y --no-install-recommends \
         wget git vim openssh-server libxml-parser-perl && \
         DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists/*

# ========================配置sshd===============================
# 用于pycharm远程调试。参考 https://zhuanlan.zhihu.com/p/76469329
# passwd修改密码，需要两段输入(用户名和密码)
RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config_bak && \
         cat /etc/ssh/sshd_config_bak | sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' > /etc/ssh/sshd_config && \
         echo "root:123456" | chpasswd



# full里有jieba
RUN pip install flask


# docker run -v 映射后，会出现no permission的问题。
# USER 1001
# USER rasa

