#!/bin/bash -xe

# Install fahclient

case "${CLIENT_VERSION}" in

7.4.15 | 7.4.16 | 7.4.17 | 7.4.18) 

  wget https://download.foldingathome.org/releases/beta/release/fahclient/centos-6.7-64bit/v7.4/fahclient-${CLIENT_VERSION}-1.x86_64.rpm
  ;;

7.5.0 | 7.5.1)

  wget https://download.foldingathome.org/releases/beta/release/fahclient/centos-6.7-64bit/v7.5/fahclient-${CLIENT_VERSION}-1.x86_64.rpm

  ;;

*)
  echo "Unsupported version: ${CLIENT_VERSION}"
  exit 1

esac

rpm -ihv --nodeps --noscripts "./fahclient-*.rpm"

mkdir -p /var/lib/fahclient || true
mkdir -p /etc/fahclient || true
mkdir -p /var/lib/fahclient/logs || true
mkdir -p /var/lib/fahclient/work || true

useradd -r -d /var/lib/fahclient -c "Folding@home Client" fahclient

chown -R fahclient.root '/var/lib/fahclient' '/etc/fahclient'

rm -rf /var/cache/yum

exit 0
