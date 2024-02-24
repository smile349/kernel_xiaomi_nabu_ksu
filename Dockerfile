FROM ubuntu:23.04
LABEL org.opencontainers.image.authors="undefined_1@outlook.com"
LABEL description="This Image used to build kernel with ksu for xiaomi nabu."
RUN ["/bin/sh", "-c", "apt update && apt install git curl wget -y"]
RUN ["/bin/sh", "-c", "wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz"]
RUN ["/bin/sh", "-c", "tar xzf Python-2.7.9.tgz"]
RUN ["/bin/sh", "-c", "cd Python-2.7.9 && ./configure --enable-optimizations && make altinstall"]
RUN ["/bin/sh", "-c", "ln /usr/local/bin/python2.7 /usr/local/bin/python2"]
ENTRYPOINT [ "/bin/bash", "-c", "./buildkernel.sh" ]