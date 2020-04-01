FROM registry.access.redhat.com/ubi8/ubi

LABEL maintainer "danclark@redhat.com"

LABEL   Version="7.5.1" \
        Release="1" \
        summary="Folding at home client" \
        description="Folding at home client."


USER root

EXPOSE 7396
EXPOSE 36330

VOLUME /var/lib/fahclient
VOLUME /etc/fahclient

RUN dnf --setopt tsflags=nodocs -y update \
 && dnf --setopt tsflags=nodocs -y install make compat-openssl10 freeglut mesa-libGLU python2 pygtk2 libcanberra-gtk2 wget \
 && wget https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.5/fahclient-7.5.1-1.x86_64.rpm \
 && rpm -ihv --nodeps --noscripts fahclient-7.5.1-1.x86_64.rpm \
 && rm -rf /var/cache/yum

RUN test -d /var/lib/fahclient || mkdir /var/lib/fahclient \
 && test -d /etc/fahclient || mkdir /etc/fahclient \
 && test -d /var/lib/fahclient/logs || mkdir -p /var/lib/fahclient/logs \
 && test -d /var/lib/fahclient/work || mkdir -p /var/lib/fahclient/work \
 && useradd -r -d /var/lib/fahclient -c "Folding@home Client" fahclient

USER fahclient

ENTRYPOINT ["/usr/bin/FAHClient"]

