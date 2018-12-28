
# Introduction





GETTING_STARTED



# Run

## Test
```sh
nvidia-docker run --rm -it bitspeech/detectron:c2-cuda9-cudnn7 python2 detectron/tests/test_batch_permutation_op.py
```


## Inference with Pretrained Models

```sh
# 12服务器
# cd tutorial
nvidia-docker run --rm -it \
  -p 8888:8888 \
  -v `pwd`:/root \
  bitspeech/detectron:c2-cuda9-cudnn7 bash
```

## DenseNet


# Dockerfile

build
```sh
docker build -t bitspeech/detectron:c2-cuda9-cudnn7 .
```


# Reference

1. https://github.com/facebookresearch/Detectron/blob/master/docker/Dockerfile
1. https://github.com/facebookresearch/Detectron/blob/master/GETTING_STARTED.md
1. https://github.com/facebookresearch/Detectron/blob/master/INSTALL.md#docker-image
