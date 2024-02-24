FROM ubuntu:23.04
LABEL org.opencontainers.image.authors="undefined_1@outlook.com"
LABEL description="This Image used to build kernel with ksu for xiaomi nabu."

RUN ["/bin/sh", "-c", "apt update && apt install git curl -y"]
RUN ["echo", "$(pwd)"]
RUN ["echo", "$(ls)"]
ENTRYPOINT [ "bash ./buildkernel.sh" ]