# Pytorch Docker Images

[DockerHub]: https://hub.docker.com/r/cnstark/pytorch

[![LICENSE](https://img.shields.io/github/license/cnstark/pytorch_docker.svg)](https://github.com/cnstark/pytorch_docker/blob/master/LICENSE)

Pure pytorch docker images with different os, cuda, and python versions.

Fork and Modify From Github: https://github.com/cnstark/pytorch-docker

## Changelog
* 2023/11/26: Support for pytorch 2.1.1.
* 2023/07/10: Support for pytorch 2.0.1.
* 2023/05/04: Support for pytorch 2.0.

## Usage

### Preparation

* [Docker](https://docs.docker.com/engine/install/)
* [Nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/overview.html) (If a CUDA is required)

### Use pytorch docker

As same as [Pytorch Official](https://github.com/pytorch/pytorch#docker-image).

```shell
docker run -it --rm \
    --gpus all \
    --net host 
    -v /path/to/project:/path/to/project \
    -v /path/to/dataset:/path/to/dataset \
    pytorch/pytorch:[TAG]
```

Note: `/path/to/project` and `/path/to/dataset` is your **own** project path and dataset path, should be replaced in use.

## Image List (More images are on the way ~)

<!-- Pytorch versions -->
[pytorch2.1.1]: https://img.shields.io/badge/Pytorch-2.1.1-orange?logo=pytorch
[pytorch2.0.1]: https://img.shields.io/badge/Pytorch-2.0.1-orange?logo=pytorch
[pytorch1.13.1]: https://img.shields.io/badge/Pytorch-1.13.1-orange?logo=pytorch
[pytorch1.12.1]: https://img.shields.io/badge/Pytorch-1.12.1-orange?logo=pytorch

<!-- Python versions -->
[python3.10.11]: https://img.shields.io/badge/Python-3.10.11-blue?logo=python
[python3.9.18]: https://img.shields.io/badge/Python-3.9.18-blue?logo=python
[python3.8.18]: https://img.shields.io/badge/Python-3.9.18-blue?logo=python


<!-- OS versions -->
[ubuntu22.04]: https://img.shields.io/badge/Ubuntu-22.04-orange?logo=ubuntu
[ubuntu20.04]: https://img.shields.io/badge/Ubuntu-20.04-orange?logo=ubuntu
[ubuntu18.04]: https://img.shields.io/badge/Ubuntu-18.04-orange?logo=ubuntu

<!-- CUDA versions -->
[cuda12.1]: https://img.shields.io/badge/CUDA-12.1-green?logo=nvidia
[cuda12.1-devel]: https://img.shields.io/badge/CUDA-12.1--devel-green?logo=nvidia
[cuda11.8]: https://img.shields.io/badge/CUDA-11.8-green?logo=nvidia
[cuda11.8-devel]: https://img.shields.io/badge/CUDA-11.8--devel-green?logo=nvidia
[cuda11.7]: https://img.shields.io/badge/CUDA-11.7-green?logo=nvidia
[cuda11.7-devel]: https://img.shields.io/badge/CUDA-11.7--devel-green?logo=nvidia
[cuda11.6]: https://img.shields.io/badge/CUDA-11.6-green?logo=nvidia
[cuda11.6-devel]: https://img.shields.io/badge/CUDA-11.6--devel-green?logo=nvidia
[cuda11.3]: https://img.shields.io/badge/CUDA-11.3-green?logo=nvidia
[cuda11.3-devel]: https://img.shields.io/badge/CUDA-11.3--devel-green?logo=nvidia

<!-- plugins -->
[jupyterlab]: https://img.shields.io/badge/jupyterlab-wheat?logo=Jupyter
[vscode]: https://img.shields.io/badge/Codesever-dodgerblue?logo=visualstudiocode
[tensorboard]: https://img.shields.io/badge/Tensorboard-dodgerblue?logo=tensorflow


<!-- order: cuda, python, os -->

### 2.1.1

| Image | Image Name | 
| -------------| -------------|
| ![pytorch2.1.1] ![python3.9.18] ![cuda12.1-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/torch-2.1.1-py3.9.18-cuda12.1.1-devel-ubuntu20.04` |
|  ![python3.9.18] ![cuda12.1-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda12.1.1-devel-ubuntu20.04` |
|  ![python3.9.18] ![cuda12.1] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda12.1.1-runtime-ubuntu20.04` |
### 2.0.1

| Image | Image Name | 
| -------------| -------------|
| ![pytorch2.0.1] ![python3.9.18] ![cuda11.8-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/torch-2.0.1-py3.9.18-cuda11.8.0-devel-ubuntu20.04` |
|  ![python3.9.18] ![cuda11.8-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.8.0-devel-ubuntu20.04` |
|  ![python3.9.18] ![cuda11.8] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.8.0-runtime-ubuntu20.04` |


### 1.13.1

| Image | Image Name | 
| -------------| -------------|
| ![pytorch1.13.1] ![python3.9.18] ![cuda11.7-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/torch-1.13.1-py3.9.18-cuda11.7.1-devel-ubuntu20.04` |
|  ![python3.9.18] ![cuda11.7-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.7.1-devel-ubuntu20.04` |
|  ![python3.9.18] ![cuda11.7] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.7.1-runtime-ubuntu20.04` |

### 1.12.1

| Image | Pull Command | 
| -------------| -------------|
| ![pytorch1.12.1] ![python3.9.18] ![cuda11.6-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/torch-1.12.1-py3.9.18-cuda11.6.2-devel-ubuntu20.04` |
| ![pytorch1.12.1] ![python3.9.18] ![cuda11.3-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/torch-1.12.1-py3.9.18-cuda11.3.1-devel-ubuntu20.04` |
| ![python3.9.18] ![cuda11.6-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.6.2-devel-ubuntu20.04` |
| ![python3.9.18] ![cuda11.3-devel] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.3.1-devel-ubuntu20.04` |
| ![python3.9.18] ![cuda11.6] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.6.2-runtime-ubuntu20.04` |
| ![python3.9.18] ![cuda11.3] ![ubuntu20.04] ![jupyterlab] ![vscode] ![tensorboard]| `docker.kt.io/baseimages/py3.9.18-cuda11.3.1-runtime-ubuntu20.04` |

## Other Images

### Generate Build Script

Generate build script by following command (available versions see [Available Versions](#Available-Versions)):

change the config.yaml
```yaml
# choose useable config combination in readme.md
os: ubuntu
os_version: "20.04" # 22.04 18.04
python: "3.9.18" # 3.8.18，3.10.13
cuda: "11.3" # 12.1 11.8 11.7 11.6 11.5 11.4 11.3 https://hub.docker.com/r/nvidia/cuda/tags?page=1&name=cudnn8-runtime-ubuntu
cuda_flavor: devel # 推荐使用 runtime 如果需要nvcc，请使用devel
install_pytorch: false # true false
pytorch: "2.1.1" # https://pytorch.org/get-started/previous-versions/
```

use python to generate bash file
```shell
pip install hydra omegaconf
python generate_build_script.py
```

### Build Pytorch Docker Image

```
bash scripts/build_xxx.sh
```

## Available Versions

### OS Versions

| OS | OS version |
| - | - |
| Ubuntu | 22.04, 20.04, 18.04, 16.04, 14.04 |

### CUDA Versions

| CUDA | CuDNN | OS(version) |
| - | - | - |
| 12.1 | 8 | Ubuntu(22.04, 20.04, 18.04) |
| 11.8 | 8 | Ubuntu(22.04, 20.04, 18.04) |
| 11.7 | 8 | Ubuntu(22.04, 20.04, 18.04) |
| 11.6 | 8 | Ubuntu(20.04, 18.04) |
| 11.3 | 8 | Ubuntu(20.04, 18.04, 16.04) |
| 11.2 | 8 | Ubuntu(20.04, 18.04, 16.04) |
| 11.1 | 8 | Ubuntu(20.04, 18.04, 16.04) |
| 11.0 | 8 | Ubuntu(18.04, 16.04) |
| 10.2 | 7 | Ubuntu(18.04, 16.04) |
| 10.1 | 7 | Ubuntu(18.04, 16.04, 14.04) |
| 10.0 | 7 | Ubuntu(18.04, 16.04, 14.04) |
| 9.2 | 7 | Ubuntu(16.04, 14.04) |

### Pytorch Versions

| Version | CUDA/CPU |
| - | - |
| 2.1.1 | cpu, 12.1, 11.8 |
| 2.0.1 | cpu, 11.8, 11.7 |
| 2.0.0 | cpu, 11.8, 11.7 |
| 1.13.1 | cpu, 11.7, 11.6 |
| 1.13.0 | cpu, 11.7, 11.6 |
| 1.12.1 | cpu, 11.6, 11.3, 10.2 |
| 1.12.0 | cpu, 11.6, 11.3, 10.2 |
| 1.11.0 | cpu, 11.3, 10.2 |
| 1.10.2 | cpu, 11.3, 10.2 |
| 1.9.1 | cpu, 11.1, 10.2 |
| 1.9.0 | cpu, 11.1, 10.2 |
| 1.8.1 | cpu, 11,1, 10.2, 10.1 |
| 1.8.0 | cpu, 11.1, 10.2 |
| 1.7.1 | cpu, 11.0, 10.2, 10.1, 9.2 |
| 1.7.0 | cpu, 11.0, 10.2, 10.1, 9.2 |
| 1.6.0 | cpu, 10.2, 10.1, 9.2 |
| 1.5.1 | cpu, 10.2, 10.1, 9.2 |
| 1.5.0 | cpu, 10.2, 10.1, 9.2 |
| 1.4.0 | cpu, 10.1, 9.2 |
| 1.2.0 | cpu, 10.0, 9.2 |
