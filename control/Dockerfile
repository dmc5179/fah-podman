FROM quay.io/fah/base:latest

ARG CONTROL_VERSION
ENV CONTROL_VERSION=${CONTROL_VERSION:-7.5.1)

USER root

RUN wget "https://download.foldingathome.org/releases/beta/release/fahcontrol/centos-6.7-64bit/v7.6/fahcontrol-7.6.5-1.noarch.rpm" \
 && rpm -ihv --nodeps --noscripts fahcontrol-7.6.5-1.noarch.rpm \
 && rm -rf /var/cache/yum

ENTRYPOINT ["/usr/bin/FAHControl"]

