FROM ubi8/ubi:latest

USER root

RUN dnf --setopt tsflags=nodocs -y update \
 && dnf --setopt tsflags=nodocs -y install make compat-openssl10 freeglut mesa-libGLU python2 pygtk2 libcanberra-gtk2 wget \
 && wget wget https://download.foldingathome.org/releases/public/release/fahviewer/centos-6.7-64bit/v7.5/fahviewer-7.5.1-1.x86_64.rpm \
 && rpm -ihv --nodeps --noscripts fahviewer-7.5.1-1.x86_64.rpm \
 && rm -rf /var/cache/yum

ENTRYPOINT ["FAHViewer"]

