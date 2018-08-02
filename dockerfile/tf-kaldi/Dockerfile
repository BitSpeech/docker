
FROM tensorflow/tensorflow:1.3.0-gpu
LABEL maintainer "xusong <song.xu01@bitmain.com>"


RUN apt-get update && apt-get install -y --no-install-recommends\
        build-essential vim wget && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*


# NLP lib
RUN pip install -U pip && pip install --no-cache-dir \
        jieba six


RUN cd /root && \
        git clone tensorflow/tensorflow:v1.8.0 && \
        git clone tensorflow/


WORKDIR "/root/"

CMD ["/bin/bash"]
