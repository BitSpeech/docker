# Start CPU only container

```
docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6 /bin/bash
```


# Start GPU (CUDA) container

Install nvidia-docker and run
```sh
nvidia-docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6-gpu /bin/bash
```

Other versions See the list of tags.




# Quick Start

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

For more details see https://github.com/tensorflow/tensor2tensor


## Serving

