# google colab
#

FROM tensorflow/tensorflow:1.8.0
LABEL maintainer "xusong <song.xu01@bitmain.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential vim git wget ffmpeg sox && \
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







# Error: apt-get update
# E: GPG error: http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64
# Release: The following signatures were invalid: NODATA 1  NODATA 2
# E: GPG error: http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64
# Release: The following signatures were invalid: NODATA 1  NODATA 2
