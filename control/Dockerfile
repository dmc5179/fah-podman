FROM ubi7/ubi:latest

USER root

RUN yum --setopt tsflags=nodocs -y update \
 && yum --setopt tsflags=nodocs -y install make compat-openssl10 freeglut mesa-libGLU python2 pygtk2 libcanberra-gtk2 wget xorg-x11-apps \
 && wget https://download.foldingathome.org/releases/public/release/fahcontrol/centos-6.7-64bit/v7.5/fahcontrol-7.5.1-1.noarch.rpm \
 && rpm -ihv --nodeps --noscripts fahcontrol-7.5.1-1.noarch.rpm \
 && rm -rf /var/cache/yum

ENTRYPOINT ["/usr/bin/FAHControl"]

