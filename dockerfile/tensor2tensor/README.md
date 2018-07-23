# Start CPU only container

```
$ docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6
```

Go to your browser on http://localhost:8888/


# Start GPU (CUDA) container

Install nvidia-docker and run
```sh
nvidia-docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6-gpu
```
Go to your browser on http://localhost:8888/

Other versions (like release candidates, nightlies and more)
See the list of tags. Devel docker images include all the necessary dependencies to build from source whereas the other binaries simply have TensorFlow installed.

For more details details see


# Quick Start

```sh
nvidia-docker run -it bitspeech/tensor2tensor:1.6.6-gpu bash
```


```sh
t2t-trainer \
  --generate_data \
  --data_dir=~/t2t_data \
  --output_dir=~/t2t_train/mnist \
  --problem=image_mnist \
  --model=shake_shake \
  --hparams_set=shake_shake_quick \
  --train_steps=1000 \
  --eval_steps=100
```

see more https://github.com/tensorflow/tensor2tensor

<!--
不同的github branch/tag代表不同的docker tag，参考 https://gitlab.com/nvidia/cuda
-->
