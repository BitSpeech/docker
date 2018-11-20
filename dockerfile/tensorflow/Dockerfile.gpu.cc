FROM tensorflow/tensorflow:1.8.0-devel-gpu
LABEL maintainer "xusong <song.xu01@bitmain.com>"




# Optional
RUN apt-get install update && \
    apt-get install git vim && \
    pip install jieba
    \

# Build tensorflow
Run
# install nodejs npm yarn (nodejs的包管理器)






apt-get update
