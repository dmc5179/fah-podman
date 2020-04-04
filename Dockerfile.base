FROM centos:8

LABEL maintainer "danclark@redhat.com"

LABEL   summary="Base image for folding at home client" \
        description="Base image for fah clients"

USER root

RUN dnf clean all \
 && dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
 && dnf --setopt tsflags=nodocs -y update \
 && dnf --setopt tsflags=nodocs -y install make compat-openssl10 \
        freeglut mesa-libGLU python2 pygtk2 libcanberra-gtk2 wget \
 && dnf clean all \
 && rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]

