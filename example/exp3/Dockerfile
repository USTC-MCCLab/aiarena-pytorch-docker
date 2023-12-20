FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu20.04
# 这个镜像根据自己的需要选择基础镜像 

################################
#       使用apt 安装基本软件      #
################################
ENV LANG C.UTF-8
ENV APT_INSTALL="apt-get install -y --no-install-recommends"
ENV PIP_INSTALL="python -m pip --no-cache-dir install --upgrade --default-timeout 100"

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/http:/https:/g' /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/* \
    /etc/apt/sources.list.d/cuda.list \ && \
    apt-get clean && apt-get update

RUN DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    git htop rar sudo swig tar tmux tzdata unrar unzip wget curl zip zsh vim \
    openssh-client openssh-server openssl net-tools locales dpkg-dev tree \
    apt-utils build-essential ca-certificates cifs-utils  binutils \
    cmake gcc g++
# 根据自己需要增加其他依赖软件

################################
#            安装conda         #
################################
RUN curl https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ./miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda && \
    /opt/conda/bin/conda init bash&& \
    rm miniconda.sh
ENV PATH /opt/conda/bin:${PATH}

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
RUN ${PIP_INSTALL} -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

################################
#       设置时区和语言           #
################################
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    echo "Asia/Shanghai" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

SHELL ["/bin/bash", "--login", "-c"]
ENV envname pytorch
RUN conda create -y -n $envname python=3.10 && \
    source activate $envname && \
    # conda install -y pytorch=2.1.1 torchvision pytorch-cuda=12.1 -c pytorch -c nvidia && \
    conda install -y tensorboard scipy scikit-learn ipykernel && \
    conda clean -ay && \
    echo "conda activate "$envname >> ~/.bashrc

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