FROM ubuntu:18.04 as base

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install  -y \
        libncurses5-dev \
        lib32z1* \
        pkg-config \
        libc6-dev-i386 \
        lib32z1 \
        lib32ncurses5 \
        cmake \
        libncurses5-dev \
        libncursesw5-dev \
        bc \
        xz-utils \
        automake \
        libtool \
        libevdev-dev \
        pkg-config \
        xz-utils \
        python \
        git \
        make \
        gcc \
        g++ \ 
        wget \ 
        cpio \
        unzip \
        rsync \
        flashrom \
        binwalk

RUN wget https://github.com/steward-fu/archives/releases/download/miyoo-mini-plus/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.gz
RUN tar -xvf gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.gz

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash