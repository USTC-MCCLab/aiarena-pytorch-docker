#!/bin/sh

export BASE_IMAGE=nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

export PYTHON_VERSION=3.9.18
export CONDA_VERSION=latest

export IMAGE_TAG=py3.9.18-cuda11.3.1-devel-ubuntu20.04

./docker/build.sh
