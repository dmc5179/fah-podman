FROM quay.io/fah/base:latest

LABEL maintainer "danclark@redhat.com"

LABEL   Version="7.5.1" \
        Release="1" \
        summary="Folding at home client" \
        description="Folding at home client."

# Supported BETA Versions:
# 7.4.15
# 7.4.16
# 7.4.17
# 7.4.18
# 7.6.1
# 7.6.2
# 7.6.3
# 7.6.4
# 7.6.5
# 7.6.6
# Supported Release Version:
# 7.5.0
# 7.5.1

ARG CLIENT_VERSION
ENV CLIENT_VERSION=${CLIENT_VERSION:-7.5.1)

USER root

EXPOSE 7396
EXPOSE 36330

VOLUME /var/lib/fahclient
VOLUME /etc/fahclient

COPY install.sh /tmp/install.sh
RUN /tmp/install.sh && rm -f /tmp/install.sh

USER fahclient

ENTRYPOINT ["/usr/bin/FAHClient"]

