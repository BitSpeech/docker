FROM tensorflow/tensorflow:1.12.0-devel-gpu
LABEL maintainer "xusong <song.xu01@bitmain.com>"

# if got error when apt-get udpate, try to uncomment the following lines
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list && \
#         rm /etc/apt/sources.list.d/cuda.list


# install tensorflow_model_server https://www.tensorflow.org/serving/setup#installing_the_modelserver
RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list && \
        curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add - && \
        \
# install nodejs npm yarn (package manager)
        curl -sL https://deb.nodesource.com/setup_10.x | bash -  && \
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install -y --no-install-recommends \
        build-essential vim nodejs yarn ffmpeg sox autoconf automake libtool && \
# install tensorflow-model-server
        \
# apt-get clean
        \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*


# install protobuf:  https://github.com/google/protobuf/blob/master/src/README.md

# RUN git clone https://github.com/google/protobuf.git && \
#         cd protobuf && git checkout  \
#         git submodule update --init --recursive && \
#         ./autogen.sh && ./configure && \
#         make && make check && make install && ldconfig



# --index https://mirrors.aliyun.com/pypi/simple/
RUN pip install -U pip && pip install --no-cache-dir \
        tensor2tensor==1.11.0  \
        jieba
# tensorflowjs tensorflow-serving-api

# build tensorflow for C++: https://blog.csdn.net/rockingdingo/article/details/75452711
# RUN git clone https://github.com/tensorflow/tensorflow tensorflow-1.10 && \
#        cd tensorflow-1.10 && git checkout r1.10 && \
#        ./configure && \
#        bazel build --config=opt --config=cuda //tensorflow:libtensorflow_cc.so



# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/root/"

CMD ["jupyter", "notebook", "--allow-root"]
