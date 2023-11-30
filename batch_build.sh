#!/bin/bash

# FILEPATH: /SSD/data/songhl/DOCKER/aiarena-pytorch-images/batch_build.sh

# 获取scripts目录下的所有文件
files=$(find scripts -type f)

# 清空 imageslist.txt
echo "" > imageslist.txt

# 遍历文件列表并执行
for file in $files; do
    bash "$file"
    tail -n 2 imageslist.txt | while IFS= read -r image; do
    docker push "$image" > /dev/null &
    done
done

cat imageslist.txt
rm imageslist.txt