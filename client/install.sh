#!/bin/bash -xe

# Install fahclient

BASE_URL="https://download.foldingathome.org/releases/beta/release/fahclient/centos-6.7-64bit"

wget "${BASE_URL}/v${CLIENT_VERSION:0:3}/fahclient-${CLIENT_VERSION}-1.x86_64.rpm"

rpm -ihv --nodeps --noscripts "./fahclient-*.rpm"

mkdir -p /var/lib/fahclient || true
mkdir -p /etc/fahclient || true
mkdir -p /var/lib/fahclient/logs || true
mkdir -p /var/lib/fahclient/work || true

# TODO: Setting the uid/gid here make it easier to map to the host
#       But this has not yet been implemented
#groupadd --gid 1043 fahclient
#useradd --uid 1043 --gid 1043 -d /var/lib/fahclient -c "Folding@home Client" fahclient
useradd -U -d /var/lib/fahclient fahclient

chown -R fahclient.root '/var/lib/fahclient' '/etc/fahclient'

rm -rf /var/cache/yum

exit 0
