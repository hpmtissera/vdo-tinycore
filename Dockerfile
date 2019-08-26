FROM tatsushid/tinycore:10.0-x86_64 AS vdo-build

LABEL maintainer="hpmtissera@gmail.com"

RUN tce-load -wci bash
RUN tce-load -wci openssl-dev
RUN tce-load -wci gcc
RUN tce-load -wci compiletc
RUN tce-load -wci readline-dev
RUN tce-load -wci cmake
RUN tce-load -wci git
RUN tce-load -wci elfutils-dev
RUN tce-load -wci gzip
RUN tce-load -wci lvm2-dev.tcz

# Build lvm2 to generate libdevmapper-event.h and libdevmapper-event.so.1.02 files
RUN mkdir -p /opt/build
RUN cd /opt/build
COPY build-lvm2.sh /opt/build
RUN sudo chmod +x /opt/build/build-lvm2.sh
RUN sudo /opt/build/build-lvm2.sh
