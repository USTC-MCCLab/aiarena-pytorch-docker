#!/bin/sh

export BASE_IMAGE=nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

export PYTHON_VERSION=3.9.18
export CONDA_VERSION=latest

export PYTORCH_VERSION=1.12.1
export PYTORCH_VERSION_SUFFIX=+cu113
export TORCHVISION_VERSION=0.13.1
export TORCHVISION_VERSION_SUFFIX=+cu113
export TORCHAUDIO_VERSION=0.12.1
export TORCHAUDIO_VERSION_SUFFIX=+cu113
export PYTORCH_DOWNLOAD_URL=https://download.pytorch.org/whl/cu113/torch_stable.html

export IMAGE_TAG=torch1.12.1-py3.9.18-cuda11.3.1-devel-ubuntu20.04

./docker/build.sh
