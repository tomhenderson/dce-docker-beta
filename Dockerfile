FROM ubuntu:16.04

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get clean && apt-get update && apt-get install -y \
    git \
    wget \
    unrar \       
    ninja-build \
    curl \
    p7zip-full \
    autoconf \
    build-essential \
    bison \
    flex \
    libdb-dev \
    libexpat1-dev \
    libpcap-dev \
    libssl-dev \
    gawk \  
    bc \
    grsync \
    pkg-config \
    unzip \
    vim \
    gir1.2-goocanvas-2.0 \
    gir1.2-gtk-3.0 \
    tcpdump \
    mercurial \
    qt5-default \
    gdb \
    build-essential \
    software-properties-common \
 && rm -rf /var/lib/apt/lists/ \
 && apt-get update && apt-get install -y

RUN add-apt-repository ppa:jblgf0/python -y \
 && apt-get update \
 && apt-get install -y python3.6 \
 && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 60

RUN curl https://bootstrap.pypa.io/pip/3.6/get-pip.py | python3.6

RUN pip install requests && pip install distro
RUN pip3 install requests && pip3 install distro

RUN mkdir -p /bake && \
    cd

RUN echo "Initial README" >> /bake/README

RUN echo ":set noincsearch" >> /root/.vimrc && \
    echo ":set encoding=utf-8" >> /root/.vimrc && \
    echo ":set fileencodings=utf-8" >> /root/.vimrc
