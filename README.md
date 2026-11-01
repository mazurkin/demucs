# demucs environment

Conda environment and bootstrap scripts for [FaceBook DEMUCS](https://github.com/facebookresearch/demucs)

## install

```shell
# conda env + python + poetry
$ make env-create

# packages
$ make env-poetry-install
```

## run

```shell
# run stem separation, check the "separated/htdemucs" folder after
bin/demucs.sh -v --name htdemucs_ft --shifts 5 "song.mp3"
```

## cache

demucs downloads the models to `~/.cache/torch/hub/`
