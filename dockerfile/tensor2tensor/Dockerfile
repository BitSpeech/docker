# name:     bitspeech/tensor2tensor:1.6.6
# build:    docker build -f Dockerfile.gpu  . -t bitspeech/tensor2tensor:1.6.6-gpu
FROM tensorflow/tensorflow:1.8.0
LABEL maintainer "xusong <song.xu01@bitmain.com>"

# RUN rm /etc/apt/sources.list.d/nvidia-ml.list && \
#         rm /etc/apt/sources.list.d/cuda.list

RUN apt-get update && apt-get install -y --no-install-recommends\
        build-essential vim wget ffmpeg sox && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --index https://mirrors.aliyun.com/pypi/simple/ \
        tensor2tensor==1.6.6 \
        jieba six pydub

# download notebook
ENV T2T_PATH=https://github.com/tensorflow/tensor2tensor/raw/v1.6.6/tensor2tensor/notebooks
RUN mkdir /root/notebooks && \
        cd /root/notebooks && \
        wget ${T2T_PATH}/asr_transformer.ipynb && \
        wget ${T2T_PATH}/hello_t2t-rl.ipynb && \
        wget ${T2T_PATH}/hello_t2t.ipynb

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
