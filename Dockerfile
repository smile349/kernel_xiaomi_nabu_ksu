FROM ubuntu:23.04
LABEL org.opencontainers.image.authors="undefined_1@outlook.com"
LABEL description="This Image used to build kernel with ksu for xiaomi nabu."
RUN apt update && apt install -y \
    git curl wget lib32ncurses5-dev automake \
    libssl-dev lzop policycoreutils xsltproc libbz2-1.0 \
    lib32z-dev unzip bzip2 maven liblz4-tool libghc-bzlib-dev \ 
    libxml-simple-perl build-essential flex gperf pngcrush \ 
    libxml-sax-base-perl x11proto-core-dev minicom libswitch-perl \ 
    ccache libxml2-utils git bison pwgen zip schedtool wget libx11-dev \ 
    bc libc6-dev-i386 g++-multilib zlib1g-dev dpkg-dev libelf-dev \
    libdebuginfod-dev squashfs-tools optipng curl \ 
    libgl1-mesa-dev libbz2-dev make gnupg libncurses5 fontconfig
RUN wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
RUN tar xzf Python-2.7.9.tgz
RUN cd Python-2.7.9 && ./configure --enable-optimizations && make altinstall -j$(nproc --all)
RUN ln /usr/local/bin/python2.7 /usr/local/bin/python2
ENTRYPOINT [ "/bin/bash", "-c", "./buildkernel.sh" ]