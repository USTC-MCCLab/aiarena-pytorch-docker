FROM docker.kt.io/baseimages/pytorch-1.12.1-py3.9.18-cuda11.3.1-devel-ubuntu20.04:latest
# 这个镜像根据自己的需要选择基础镜像 

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    htop  
# 根据自己需要增加其他依赖软件

#######################################
#    更换 pip 的软件源（可选）   #
#######################################
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

################################
#        安装 python 库       #
################################
# 在这里更改对应命令安装所需的python库
ENV PIP_INSTALL="python -m pip --no-cache-dir install --upgrade --default-timeout 100"
# 准备 requirements.txt 文件
# COPY ./requirements.txt /tmp/requirements.txt
# RUN ${PIP_INSTALL} -r /tmp/requirements.txt
RUN ${PIP_INSTALL} psutil wheel nvitop wandb hydra-core omegaconf

################################
#        清理安装缓存            #
################################
RUN ldconfig && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache/pip