FROM ubi8/ubi:latest

USER root

EXPOSE 7396
EXPOSE 36330

RUN dnf --setopt tsflags=nodocs -y update \
 && dnf --setopt tsflags=nodocs -y install make compat-openssl10 freeglut mesa-libGLU python2 pygtk2 libcanberra-gtk2 wget bind-utils iproute net-tools \
 && wget https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.5/fahclient-7.5.1-1.x86_64.rpm \
 && rpm -ihv --nodeps --noscripts fahclient-7.5.1-1.x86_64.rpm \
 && rm -rf /var/cache/yum

COPY run_fahclient.sh /usr/local/bin/run_fahclient.sh

RUN test -d /var/lib/fahclient || mkdir /var/lib/fahclient \
 && test -d /etc/fahclient || mkdir /etc/fahclient \
 && chmod +x /usr/local/bin/run_fahclient.sh \
 && useradd -r -d /var/lib/fahclient -s /sbin/nologin -c "Folding@home Client" fahclient \
 && chown -R fahclient /var/lib/fahclient /etc/fahclient \
 && find /var/lib/fahclient /etc/fahclient -exec chmod ug+rw,o+r '{}' \;

#USER fahclient

ENTRYPOINT ["/usr/local/bin/run_fahclient.sh"]

