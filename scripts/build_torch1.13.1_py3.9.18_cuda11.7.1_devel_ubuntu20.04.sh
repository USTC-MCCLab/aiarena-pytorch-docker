#!/bin/sh

export BASE_IMAGE=nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

export PYTHON_VERSION=3.9.18
export CONDA_VERSION=latest

export PYTORCH_VERSION=1.13.1
export PYTORCH_VERSION_SUFFIX=+cu117
export TORCHVISION_VERSION=0.14.1
export TORCHVISION_VERSION_SUFFIX=+cu117
export TORCHAUDIO_VERSION=0.13.1
export TORCHAUDIO_VERSION_SUFFIX=+cu117
export PYTORCH_DOWNLOAD_URL=https://download.pytorch.org/whl/cu117/torch_stable.html

export IMAGE_TAG=torch1.13.1-py3.9.18-cuda11.7.1-devel-ubuntu20.04

./docker/build.sh
