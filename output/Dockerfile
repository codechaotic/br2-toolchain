FROM scratch
ADD toolchain/images/rootfs.tar /
WORKDIR /build
VOLUME /build/src
VOLUME /build/toolchain
VOLUME /build/dl
VOLUME /build/cache
VOLUME /build/buildroot

RUN echo "export BR2_CCACHE_DIR=/build/cache" >> /root/.bashrc \
 && echo "export BR2_DL_DIR=/build/dl" >> /root/.bashrc \
 && echo "export BR2_EXTERNAL=/build/src" >> /root/.bashrc \
 && echo "export BUILDROOT=/build/buildroot" >> /root/.bashrc \
 && echo "export TOOLCHAIN=/build/toolchain" >> /root/.bashrc

ENTRYPOINT ["/build/entrypoint.sh"]

ONBUILD ARG project
ONBUILD ADD src src
ONBUILD ADD buildroot buildroot
ONBUILD RUN make \
  PROJECT=$project \
  BUILDROOT=/build/buildroot \
  BR2_EXTERNAL=/build/src \
  TOOLCHAIN=/build/toolchain \
  BR2_DL_DIR=/build/dl \
  BR2_CCACHE_DIR=/build/cache
