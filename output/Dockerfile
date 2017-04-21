FROM scratch
ADD rootfs.tar /
WORKDIR /build
VOLUME /build/src
VOLUME /build/toolchain
VOLUME /build/dl
VOLUME /build/cache
VOLUME /build/buildroot

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
