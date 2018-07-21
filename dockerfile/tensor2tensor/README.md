# Start CPU only container

```
$ docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6
```

Go to your browser on http://localhost:8888/


# Start GPU (CUDA) container

Install nvidia-docker and run
```
$ nvidia-docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6-gpu
```
Go to your browser on http://localhost:8888/

Other versions (like release candidates, nightlies and more)
See the list of tags. Devel docker images include all the necessary dependencies to build from source whereas the other binaries simply have TensorFlow installed.

For more details details see


# Example

```
$ nvidia-docker run -it -p 8888:8888 bitspeech/tensor2tensor:1.6.6-gpu bash
```

Here's a walkthrough training a good English-to-German translation model using the Transformer model from Attention Is All You Need on WMT data.


```sh
PROBLEM=translate_ende_wmt32k
MODEL=transformer
HPARAMS=transformer_base_single_gpu

DATA_DIR=$HOME/t2t_data
TMP_DIR=/tmp/t2t_datagen
TRAIN_DIR=$HOME/t2t_train/$PROBLEM/$MODEL-$HPARAMS

mkdir -p $DATA_DIR $TMP_DIR $TRAIN_DIR

# Generate data
t2t-datagen \
  --data_dir=$DATA_DIR \
  --tmp_dir=$TMP_DIR \
  --problem=$PROBLEM

# Train
# *  If you run out of memory, add --hparams='batch_size=1024'.
t2t-trainer \
  --data_dir=$DATA_DIR \
  --problem=$PROBLEM \
  --model=$MODEL \
  --hparams_set=$HPARAMS \
  --output_dir=$TRAIN_DIR

# Decode

DECODE_FILE=$DATA_DIR/decode_this.txt
echo "Hello world" >> $DECODE_FILE
echo "Goodbye world" >> $DECODE_FILE
echo -e 'Hallo Welt\nAuf Wiedersehen Welt' > ref-translation.de

BEAM_SIZE=4
ALPHA=0.6

t2t-decoder \
  --data_dir=$DATA_DIR \
  --problem=$PROBLEM \
  --model=$MODEL \
  --hparams_set=$HPARAMS \
  --output_dir=$TRAIN_DIR \
  --decode_hparams="beam_size=$BEAM_SIZE,alpha=$ALPHA" \
  --decode_from_file=$DECODE_FILE \
  --decode_to_file=translation.en

# See the translations
cat translation.en

# Evaluate the BLEU score
# Note: Report this BLEU score in papers, not the internal approx_bleu metric.
t2t-bleu --translation=translation.en --reference=ref-translation.de

```

<!--
不同的github branch/tag代表不同的docker tag，参考 https://gitlab.com/nvidia/cuda
-->
