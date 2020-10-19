
docker build -t  bitspeech/fairseq:tmp -f Dockerfile .


docker tag c8d8ff8d05ec ai-image.jd.com/nlp/fairseq:latest



##

```
docker build -t  ai-image.jd.com/nlp/dnnlm:0.1 -f Dockerfile .

docker build -t  ai-image.jd.com/nlp/dnnlm:0.0.3 -f Dockerfile .

docker push ai-image.jd.com/nlp/dnnlm:0.0.3

docker push ai-image.jd.com/nlp/pytorch:0.4.1-cuda9.2-cudnn7.6-devel-ubuntu16.04
```
