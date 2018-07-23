# name:     bitspeech/tensor2tensor:1.6.6
# build:    docker build -f Dockerfile.gpu  . -t bitspeech/tensor2tensor:1.6.6-gpu
FROM tensorflow/tensorflow:1.8.0-py3
LABEL maintainer "xusong <song.xu01@bitmain.com>"

# if got error when apt-get udpate, try to uncomment the following lines
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list && \
#         rm /etc/apt/sources.list.d/cuda.list


# install google-cloud-sdk
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
        echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list  && \
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -  && \
        apt-get update && apt-get install -y --no-install-recommends google-cloud-sdk


RUN apt-get install -y --no-install-recommends\
        build-essential vim git wget ffmpeg sox && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*


# --index https://mirrors.aliyun.com/pypi/simple/
RUN pip install -U pip && pip install -U --no-cache-dir \
        tensor2tensor==1.6.6 \
        jieba six pydub \
        colab jupyter_http_over_ws google-cloud-storage && \
        jupyter serverextension enable --py jupyter_http_over_ws

# install colab tools
RUN git clone https://github.com/googlecolab/colabtools.git && \
        cd colabtools && python setup.py install


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

CMD ["jupyter", "notebook", "--allow-root", "--NotebookApp.allow_origin='https://colab.research.google.com'"]







# Error: apt-get update
# E: GPG error: http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64
# Release: The following signatures were invalid: NODATA 1  NODATA 2
# E: GPG error: http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64
# Release: The following signatures were invalid: NODATA 1  NODATA 2
