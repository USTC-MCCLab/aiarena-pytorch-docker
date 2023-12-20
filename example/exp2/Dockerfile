FROM docker.kt.io/baseimages/pytorch-1.12.1-py3.9.18-cuda11.3.1-devel-ubuntu20.04:latest


################################
#  更换 conda  和pip 的软件源    #
################################
RUN conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/ && \
    conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/main/ && \
    conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/ && \
    conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/msys2/ && \
    conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/ && \
    conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/menpo/ && \
    conda config --set show_channel_urls yes
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# 创建conda环境
SHELL ["/bin/bash", "--login", "-c"]
ENV envname pytorch
RUN conda create -y -n $envname python=3.10 && \
    source activate $envname && \
    # conda install -y pytorch=2.1.1 torchvision pytorch-cuda=12.1 -c pytorch -c nvidia && \
    conda install -y tensorboard tqdm scipy scikit-learn ipykernel && \
    conda clean -ay && \
    echo "conda activate "$envname >> ~/.bashrc #默认环境

ENV envname test2
RUN conda create -y -n $envname python=3.9
RUN source activate $envname && \
    pip install --no-cache-dir numpy wandb nvitop

################################
#        清理安装缓存            #
################################

RUN ldconfig && \
    conda clean -y -all && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache/pip