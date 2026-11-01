SHELL            := /bin/bash
ROOT             := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
DATE             := $(shell date '+%Y%m%d-%H%M%S')

CONDA_ENV_NAME    = demucs

CUDA_VERSION      = 13.1.0
PYTHON_VERSION    = 3.12.15
POETRY_VERSION    = 2.5.1
FFMPEG_VERSION    = 8.1.2

# -----------------------------------------------------------------------------
# notebook
# -----------------------------------------------------------------------------

.DEFAULT_GOAL = env-shell

# -----------------------------------------------------------------------------
# conda environment
# -----------------------------------------------------------------------------

.PHONY: env-create
env-create:
	@conda create --yes --copy --name "$(CONDA_ENV_NAME)" \
		conda-forge::python=$(PYTHON_VERSION) \
		conda-forge::poetry=$(POETRY_VERSION) \
		conda-forge::ffmpeg=$(FFMPEG_VERSION) \
		conda-forge::cuda=$(CUDA_VERSION)

.PHONY: env-poetry-install
env-poetry-install: export PYTHONWARNINGS = ignore::DeprecationWarning
env-poetry-install:
	@conda run --no-capture-output --live-stream --name "$(CONDA_ENV_NAME)" \
		poetry install \
          	--no-interaction \
          	--no-ansi \
          	--no-root \
			--no-directory

.PHONY: env-poetry-update
env-poetry-update: export PYTHONWARNINGS = ignore::DeprecationWarning
env-poetry-update:
	@conda run --no-capture-output --live-stream --name "$(CONDA_ENV_NAME)" \
		poetry update

.PHONY: env-poetry-show
env-poetry-show:
	@bin/run poetry show --tree

.PHONY: env-poetry-lock
env-poetry-lock:
	@conda run --no-capture-output --live-stream --name "$(CONDA_ENV_NAME)" \
		poetry lock --no-update

.PHONY: env-remove
env-remove:
	@conda env remove --yes --name "$(CONDA_ENV_NAME)"

.PHONY: env-shell
env-shell:
	@conda run --no-capture-output --live-stream --name "$(CONDA_ENV_NAME)" --cwd "$(ROOT)"\
		bash

.PHONY: env-info
env-info:
	@conda run --no-capture-output --live-stream --name "$(CONDA_ENV_NAME)" \
		conda info
