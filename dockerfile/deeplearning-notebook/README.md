

# Start CPU only container


```sh
docker run -it -p 8888:8888 bitspeech/deeplearning-notebook
```

# Start GPU (CUDA) container

```sh
nvidia-docker run -it -p 8888:8888 bitspeech/deeplearning-notebook:latest-gpu
```

# notebook

- tensor2tensor 1.6.6
- tensorflow 1.8.0
- pytorch
- keras


# add more notebooks

contact "song.xu01@bitmain.com"

or build from dockerfile by your self
