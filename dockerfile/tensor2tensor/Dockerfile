FROM tensorflow/tensorflow:1.10.0-devel
LABEL maintainer "xusong <song.xu01@bitmain.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential vim ffmpeg sox && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*


# --index https://mirrors.aliyun.com/pypi/simple/
RUN pip install -U pip && pip install --no-cache-dir \
        tensor2tensor==1.6.6 \
        jieba six


# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/root/"

CMD ["jupyter", "notebook", "--allow-root"]
