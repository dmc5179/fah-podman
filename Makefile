# Makefile to build supported images
REPOSITORY := quay.io

all: base

.PHONY: build/base
build/base:
	buildah bud -t quay.io/fah/base:latest -f Dockerfile.base .

.PHONY: push/base
push/base:
	podman push quay.io/fah/base:latest

# Supported BETA Versions:
.PHONY: build/7.4.15
build/7.4.15:
	buildah bud --build-arg CLIENT_VERSION=7.4.15 -t quay.io/fah/fah-client:v7.4.15 -f Dockerfile .

.PHONY: push/7.4.15
push/7.4.15:
	podman push quay.io/fah/fah-client:v7.4.15

.PHONY: build/7.4.16
build/7.4.16:
	buildah bud --build-arg CLIENT_VERSION=7.4.16 -t quay.io/fah/fah-client:v7.4.16 -f Dockerfile .

.PHONY: push/7.4.16
push/7.4.15:
	podman push quay.io/fah/fah-client:v7.4.16

.PHONY: build/7.4.17
build/7.4.17:
	buildah bud --build-arg CLIENT_VERSION=7.4.17 -t quay.io/fah/fah-client:v7.4.17 -f Dockerfile .

.PHONY: push/7.4.17
push/7.4.15:
	podman push quay.io/fah/fah-client:v7.4.17

.PHONY: build/7.4.18
build/7.4.18:
	buildah bud --build-arg CLIENT_VERSION=7.4.18 -t quay.io/fah/fah-client:v7.4.18 -f Dockerfile .

.PHONY: push/7.4.18
push/7.4.15:
	podman push quay.io/fah/fah-client:v7.4.18

.PHONY: build/7.5.0
# Supported Release Version:
build/7.5.0:
	buildah bud --build-arg CLIENT_VERSION=7.5.0 -t quay.io/fah/fah-client:v7.5.0 -f Dockerfile .

.PHONY: push/7.5.0
push/7.4.15:
	podman push quay.io/fah/fah-client:v7.5.0

.PHONY: build/7.5.1
build/7.5.1:
	buildah bud --build-arg CLIENT_VERSION=7.5.1 -t quay.io/fah/fah-client:v7.5.1 -f Dockerfile .

.PHONY: push/7.5.1
push/7.4.15:
	podman push quay.io/fah/fah-client:v7.5.1

