FROM debian
WORKDIR /build

RUN echo "export BR2_EXTERNAL=/build" >> /root/.bashrc
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bc \
    cpio \
    python \
    rsync \
    build-essential

ADD build .
ADD buildroot buildroot

RUN make
RUN mv toolchain/output/host/usr /toolchain && rm -Rf toolchain
RUN rm -Rf buildroot
