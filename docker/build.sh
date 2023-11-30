#!/bin/bash
DATE=$(date +%Y-%m)
IMAGE_PREFIX="docker.kt.io/baseimages/pytorch"

docker build \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg PYTHON_VERSION=${PYTHON_VERSION} \
    --build-arg CONDA_VERSION=${CONDA_VERSION} \
    --build-arg PYTORCH_VERSION=${PYTORCH_VERSION} \
    --build-arg PYTORCH_VERSION_SUFFIX=${PYTORCH_VERSION_SUFFIX} \
    --build-arg TORCHVISION_VERSION=${TORCHVISION_VERSION} \
    --build-arg TORCHVISION_VERSION_SUFFIX=${TORCHVISION_VERSION_SUFFIX} \
    --build-arg TORCHAUDIO_VERSION=${TORCHAUDIO_VERSION} \
    --build-arg TORCHAUDIO_VERSION_SUFFIX=${TORCHAUDIO_VERSION_SUFFIX} \
    --build-arg PYTORCH_DOWNLOAD_URL=${PYTORCH_DOWNLOAD_URL} \
    -t ${IMAGE_PREFIX}-${IMAGE_TAG}:${DATE} \
    -f docker/Dockerfile \
    .

docker tag ${IMAGE_PREFIX}-${IMAGE_TAG}:${DATE} ${IMAGE_PREFIX}-${IMAGE_TAG}:latest

echo ${IMAGE_PREFIX}-${IMAGE_TAG}:latest >> imageslist.txt
echo ${IMAGE_PREFIX}-${IMAGE_TAG}:${DATE} >> imageslist.txt