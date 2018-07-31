# name：     bitspeech/bazel:tensorflow1.8.0
# build：    docker build -f bazel-tensorflow1.8.0  . -t bitspeech/bazel:tensorflow1.8.0
# size:      3.37GB
# base-size: 2.95GB
FROM tensorflow/tensorflow:1.8.0-gpu
LABEL maintainer "xusong <song.xu01@bitmain.com>"

RUN rm /etc/apt/sources.list.d/nvidia-ml.list && \
        rm /etc/apt/sources.list.d/cuda.list && \
        add-apt-repository -y ppa:openjdk-r/ppa && \
        echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
        curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends\
        build-essential openjdk-8-jdk bazel vim wget git && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

WORKDIR "/root/"

CMD ["/bin/bash"]
