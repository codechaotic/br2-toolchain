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

ADD build .
ADD src src
ADD buildroot buildroot

RUN make PROJECT=toolchain BUILDROOT=/build/buildroot BR2_EXTERNAL=/build/src

RUN mv out/toolchain/host/usr toolchain
RUN rm -Rf out src buildroot

RUN echo "export BR2_CCACHE_DIR=/build/cache" >> /root/.bashrc
RUN echo "export BR2_DL_DIR=/build/dl" >> /root/.bashrc
RUN echo "export BR2_EXTERNAL=/build/src" >> /root/.bashrc
RUN echo "export BUILDROOT=/build/buildroot" >> /root/.bashrc
RUN echo "export TOOLCHAIN=/build/toolchain" >> /root/.bashrc
