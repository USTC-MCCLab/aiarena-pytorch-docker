#!/bin/sh

export BASE_IMAGE=nvidia/cuda:12.1.1-cudnn8-devel-ubuntu20.04

export PYTHON_VERSION=3.9.18
export CONDA_VERSION=latest

export PYTORCH_VERSION=2.1.1
export PYTORCH_VERSION_SUFFIX=+cu121
export TORCHVISION_VERSION=0.16.1
export TORCHVISION_VERSION_SUFFIX=+cu121
export TORCHAUDIO_VERSION=2.1.1
export TORCHAUDIO_VERSION_SUFFIX=+cu121
export PYTORCH_DOWNLOAD_URL=https://download.pytorch.org/whl/cu121/torch_stable.html

export IMAGE_TAG=2.1.1-py3.9.18-cuda12.1.1-devel-ubuntu20.04

./docker/build.sh
