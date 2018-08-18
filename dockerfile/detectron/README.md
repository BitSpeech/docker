
# Introduction

https://github.com/facebookresearch/Detectron/blob/master/INSTALL.md#docker-image



# Run

## Test
```sh
nvidia-docker run --rm -it bitspeech/detectron:c2-cuda9-cudnn7 python2 detectron/tests/test_batch_permutation_op.py
```


## Inference with Pretrained Models

```sh
nvidia-docker run --rm -it bitspeech/detectron:c2-cuda9-cudnn7 \
  -p 8888:8888 \
  -v `pwd`:/root \
  bash
```




# Dockerfile

fork from https://github.com/facebookresearch/Detectron/blob/master/docker/Dockerfile
