FROM scratch
ADD rootfs.tar /
WORKDIR /build
ONBUILD ARG PROJECT
ONBUILD ADD . src
ONBUILD RUN make -f Makefile$([[ -z "${PROJECT// }" ]] && echo "" || echo ".$PROJECT")
