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

RUN apt-get update \
 && apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget \
 && cd /usr/local/src \
 && wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz \
 && tar xzf Python-3.6.6.tgz \
 && cd Python-3.6.6 \
 && ./configure \
 && make \
 && make install \
 && update-alternatives --install /usr/local/bin/python3 python3 /usr/local/bin/python3.6 60 \
 && cd /

RUN apt-get install -y software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt-get update \
 && apt-get install g++-8 -y \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8 \ 
 && update-alternatives --config gcc

RUN pip3 install requests && pip3 install distro

RUN mkdir -p /bake && \
    cd

RUN echo "Initial README" >> /bake/README

RUN echo ":set noincsearch" >> /root/.vimrc && \
    echo ":set encoding=utf-8" >> /root/.vimrc && \
    echo ":set fileencodings=utf-8" >> /root/.vimrc
