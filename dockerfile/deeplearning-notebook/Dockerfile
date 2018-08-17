FROM tensorflow/tensorflow:1.10.0
LABEL maintainer "xusong <song.xu01@bitmain.com>"

# if got error when apt-get udpate, try to uncomment the following lines
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list && \
#         rm /etc/apt/sources.list.d/cuda.list


# install google-cloud-sdk
# reference:
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
        jieba six pydub jupyterlab \
        colab jupyter_http_over_ws google-cloud-storage portpicker && \
        jupyter serverextension enable --py jupyter_http_over_ws

# install colabtools
# reference: https://github.com/googlecolab/backend-container/blob/master/containers/Dockerfile
RUN git clone https://github.com/googlecolab/colabtools.git && \
        cd colabtools && python setup.py sdist && \
        python -m pip install dist/google-colab-0.0.1a1.tar.gz  && \
        jupyter nbextension install --py google.colab


# download notebooks
RUN mkdir -p /root/notebooks/tensor2tensor && \
# download tensor2tensor notebook
        T2T_PATH=https://github.com/tensorflow/tensor2tensor/raw/v1.6.6/tensor2tensor/notebooks && \
        cd /root/notebooks/tensor2tensor && \
        wget ${T2T_PATH}/asr_transformer.ipynb && \
        wget ${T2T_PATH}/hello_t2t-rl.ipynb && \
        wget ${T2T_PATH}/hello_t2t.ipynb && \
# download tensorflow ayme notebooks
        cd /root/notebooks/ && \
        mkdir -p /root/notebooks/tensorflow-ayme && \
        git clone https://github.com/aymericdamien/TensorFlow-Examples.git && \
        mv TensorFlow-Examples/notebooks/*  /root/notebooks/tensorflow-ayme/ && \
        mv TensorFlow-Examples/README.md /root/notebooks/tensorflow-ayme/ && \
        rm -rf TensorFlow-Examples && \
# download tensorflow model notebooks
        cd /root/notebooks/ && \
        mkdir -p /root/notebooks/tensorflow-model && \
        git clone https://github.com/tensorflow/models.git && \
        mv models/samples/core/*  /root/notebooks/tensorflow-model/ && \
        rm -rf models && \
# download tensorflow udacity notebooks
        UDA_PATH=https://github.com/tensorflow/tensorflow/raw/master/tensorflow/examples/udacity && \
        mkdir -p /root/notebooks/tensorflow-udacity && \
        cd /root/notebooks/tensorflow-udacity && \
        wget ${UDA_PATH}/1_notmnist.ipynb && \
        wget ${UDA_PATH}/2_fullyconnected.ipynb && \
        wget ${UDA_PATH}/3_regularization.ipynb && \
        wget ${UDA_PATH}/4_convolutions.ipynb && \
        wget ${UDA_PATH}/5_word2vec.ipynb	&& \
        wget ${UDA_PATH}/6_lstm.ipynb && \
        wget ${UDA_PATH}/README.md && \
# download tensorflow eager notebooks
        EAGER_PATH=https://github.com/tensorflow/tensorflow/raw/master/tensorflow/contrib/eager/python/examples/notebooks && \
        mkdir -p /root/notebooks/tensorflow-eager && \
        cd /root/notebooks/tensorflow-eager && \
        wget ${EAGER_PATH}/automatic_differentiation.ipynb && \
        wget ${EAGER_PATH}/custom_layers.ipynb  && \
        wget ${EAGER_PATH}/custom_training.ipynb && \
        wget ${EAGER_PATH}/eager_basics.ipynb && \
# download lucid notebooks
        cd /root/notebooks/ && \
        mkdir -p /root/notebooks/tensorflow-lucid && \
        git clone https://github.com/tensorflow/lucid.git && \
        mv lucid/notebooks/*  /root/notebooks/tensorflow-lucid/ && \
        mv lucid/README.md /root/notebooks/tensorflow-lucid/ && \
        rm -rf lucid && \
# download tensorflow cs231n notebooks
# download tf-learn notebooks
        mkdir -p /root/notebooks/tf-learn && \
        cd /root/notebooks/tf-learn && \
        wget https://github.com/tflearn/tflearn/raw/master/examples/notebooks/spiral.ipynb && \
# download pytorch notebooks
        mkdir -p /root/notebooks/pytorch && \
# download keras notebooks
        mkdir -p /root/notebooks/keras


# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/root/"


CMD ["jupyter", "lab", "--allow-root", "--NotebookApp.allow_origin='https://colab.research.google.com'"]







# Error: apt-get update
# E: GPG error: http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64
# Release: The following signatures were invalid: NODATA 1  NODATA 2
# E: GPG error: http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64
# Release: The following signatures were invalid: NODATA 1  NODATA 2
