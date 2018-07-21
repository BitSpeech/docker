# Start CPU only container

```
$ docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6
```

Go to your browser on http://localhost:8888/

# Start GPU (CUDA) container

Install nvidia-docker and run
```
$ nvidia-docker run -it -p 8888:8888 tensorflow/tensorflow:latest-gpu
```
Go to your browser on http://localhost:8888/

Other versions (like release candidates, nightlies and more)
See the list of tags. Devel docker images include all the necessary dependencies to build from source whereas the other binaries simply have TensorFlow installed.

For more details details see
