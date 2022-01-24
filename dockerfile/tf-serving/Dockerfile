    # ==================================================================
    # build & push:
    # docker build -t  ai-image.jd.com/nlp/tensorflow-serving:2.0.0 -f Dockerfile .
    # docker push ai-image.jd.com/nlp/tensorflow-serving:2.0.0
    # ==================================================================

    FROM tensorflow/serving:2.4.3
    LABEL maintainer="XuSong <xusong28@jd.com>"


    # 修改apt镜像源
    COPY config-mirror-for-ubuntu.sh /home/
    RUN bash /home/config-mirror-for-ubuntu.sh

    # 修改默认编码
    ENV LANG C.UTF-8
    ENV LC_ALL C.UTF-8


    # 安装基本依赖
    RUN apt-get update && apt-get install -y --no-install-recommends \
        openjdk-8-jdk curl unzip && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

    ENTRYPOINT bash
