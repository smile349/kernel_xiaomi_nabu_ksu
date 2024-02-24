FROM ubuntu:23.04
LABEL org.opencontainers.image.authors="undefined_1@outlook.com"
LABEL description="This Image used to build kernel with ksu for xiaomi nabu."

RUN ["/bin/sh", "-c", "apt update && apt install git curl -y"]
RUN ["git", "clone", "--depth", "1", "https://github.com/undefined-ux/kernel_xiaomi_nabu_ksu.git", "nabu_kernel"]
WORKDIR /nabu_kernel
ENTRYPOINT [ "./buildkernel.sh" ]