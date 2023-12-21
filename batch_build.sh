#!/bin/bash

# FILEPATH: /SSD/data/songhl/DOCKER/aiarena-pytorch-images/batch_build.sh

# 获取scripts目录下的所有文件
files=$(find scripts -type f)

# 清空 imageslist.txt
echo "" > imageslist.txt

# 遍历文件列表并执行
for file in $files; do
    bash "$file"
done

# docker images | grep "docker.kt.io/baseimages" | awk '{print $1":"$2}' | xargs -n1 docker push