ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:-compute,utility}

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/http:/https:/g' /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/* \
    /etc/apt/sources.list.d/cuda.list \ && \
    apt-get clean && apt-get update && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends\
    git htop rar sudo swig tar tmux tzdata unrar unzip wget curl zip zsh vim \
    openssh-client openssh-server openssl net-tools locales dpkg-dev tree \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
    libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

ARG PYTHON_VERSION
RUN cd /tmp && \
    wget http://npm.taobao.org/mirrors/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xvf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make && make install && \
    cd .. && rm Python-${PYTHON_VERSION}.tgz && rm -r Python-${PYTHON_VERSION} && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip && \
    python -m pip install --upgrade pip && \
    rm -r /root/.cache/pip

RUN pip --no-cache-dir install --upgrade --default-timeout 100 -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

ARG PYTORCH_VERSION
ARG PYTORCH_VERSION_SUFFIX
ARG TORCHVISION_VERSION
ARG TORCHVISION_VERSION_SUFFIX
ARG TORCHAUDIO_VERSION
ARG TORCHAUDIO_VERSION_SUFFIX
ARG PYTORCH_DOWNLOAD_URL

RUN if [ ${PYTORCH_VERSION} ] ; \
    then \
        if [ ! $TORCHAUDIO_VERSION ] ; \
        then \
            TORCHAUDIO=; \
        else \
            TORCHAUDIO=torchaudio==${TORCHAUDIO_VERSION}${TORCHAUDIO_VERSION_SUFFIX}; \
        fi && \
        if [ ! $PYTORCH_DOWNLOAD_URL ]; \
        then \
            pip install \
                torch==${PYTORCH_VERSION}${PYTORCH_VERSION_SUFFIX} \
                torchvision==${TORCHVISION_VERSION}${TORCHVISION_VERSION_SUFFIX} \
                ${TORCHAUDIO}; \
        else \
            pip install \
                torch==${PYTORCH_VERSION}${PYTORCH_VERSION_SUFFIX} \
                torchvision==${TORCHVISION_VERSION}${TORCHVISION_VERSION_SUFFIX} \
                ${TORCHAUDIO} \
                -f ${PYTORCH_DOWNLOAD_URL}; \
        fi && \
        rm -r /root/.cache/pip; \
    fi

ARG CONDA_VERSION
# https://repo.anaconda.com/miniconda/
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -o ./miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda && \
    /opt/conda/bin/conda init bash && \
    rm miniconda.sh && \
    /opt/conda/bin/conda config --set auto_activate_base false

ENV PATH ${PATH}:/opt/conda/bin

RUN ldconfig && \
    conda clean -y --all && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache/pip    

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    echo "Asia/Shanghai" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

### 平台调试任务依赖工具 ###

# 安装 jupyterlab , tensorboard 和 code-server
RUN pip --no-cache-dir install tensorboard tensorboard jupyterlab -i https://pypi.tuna.tsinghua.edu.cn/simple
# 从 https://github.com/coder/code-server/releases 下载
# ENV VSCODE_VERSION 4.19.1
# COPY ./package/code-server_${VSCODE_VERSION}_amd64.deb /tmp/code-server.deb
# RUN dpkg -i /tmp/code-server.deb && rm /tmp/code-server.deb