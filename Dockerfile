FROM debian
WORKDIR /build

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bc \
    cpio \
    python \
    rsync \
    build-essential

RUN echo "export BR2_CCACHE_DIR=/build/cache" >> /root/.bashrc \
 && echo "export BR2_DL_DIR=/build/dl" >> /root/.bashrc \
 && echo "export BR2_EXTERNAL=/build/src" >> /root/.bashrc \
 && echo "export BUILDROOT=/build/buildroot" >> /root/.bashrc \
 && echo "export TOOLCHAIN=/build/toolchain" >> /root/.bashrc

ADD build .
ENTRYPOINT ["/build/entrypoint.sh"]
