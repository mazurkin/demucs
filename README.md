# demucs environment

Conda environment and bootstrap scripts for [FaceBook DEMUCS](https://github.com/facebookresearch/demucs)

## install

```shell
# first, make an isolated Conda environment with Python, Poetry and CUDA inside
$ make env-init-conda

# then install the most of the dependencies with Poetry
$ make env-init-poetry
```

## run

```shell
# run stem separation, check the "separated/htdemucs" folder after
bin/demucs.sh -v --name htdemucs "song.mp3"
```
