# Makefile to build supported images
REGISTRY       ?= quay.io
ORG            ?= fah
IMAGE          ?= $(REGISTRY)/$(ORG)/fah-client
CUDA_IMAGE     ?= $(REGISTRY)/$(ORG)/fah-client-cuda

all: build/base push/base build/7.4.15 push/7.4.15 build/7.4.16 push/7.4.15 build/7.4.17 push/7.4.15 build/7.4.18 push/7.4.15 build/7.5.0 push/7.5.0 build/7.5.1 push/7.5.1

build: build/base build/7.4.15 build/7.4.16 build/7.4.17 build/7.4.18 build/7.5.0 build/7.5.1

push: push/base push/7.4.15 push/7.4.15 push/7.4.15 push/7.4.15 push/7.5.0 push/7.5.1

.PHONY: build/base
build/base:
	buildah bud -t $(REGISTRY)/$(ORG)/base:latest -f Dockerfile.base .

.PHONY: push/base
push/base:
	podman push $(REGISTRY)/$(ORG)/base:latest

# Supported BETA Versions:
.PHONY: build/7.4.15
build/7.4.15:
	buildah bud --build-arg CLIENT_VERSION=7.4.15 -t $(IMAGE):v7.4.15 -f Dockerfile .

.PHONY: push/7.4.15
push/7.4.15:
	podman push $(IMAGE):v7.4.15

.PHONY: build/7.4.16
build/7.4.16:
	buildah bud --build-arg CLIENT_VERSION=7.4.16 -t $(IMAGE):v7.4.16 -f Dockerfile .

.PHONY: push/7.4.16
push/7.4.16:
	podman push $(IMAGE):v7.4.16

.PHONY: build/7.4.17
build/7.4.17:
	buildah bud --build-arg CLIENT_VERSION=7.4.17 -t $(IMAGE):v7.4.17 -f Dockerfile .

.PHONY: push/7.4.17
push/7.4.17:
	podman push $(IMAGE):v7.4.17

.PHONY: build/7.4.18
build/7.4.18:
	buildah bud --build-arg CLIENT_VERSION=7.4.18 -t $(IMAGE):v7.4.18 -f Dockerfile .

.PHONY: push/7.4.18
push/7.4.18:
	podman push $(IMAGE):v7.4.18

.PHONY: build/7.5.0
# Supported Release Version:
build/7.5.0:
	buildah bud --build-arg CLIENT_VERSION=7.5.0 -t $(IMAGE):v7.5.0 -f Dockerfile .

.PHONY: push/7.5.0
push/7.5.0:
	podman push $(IMAGE):v7.5.0

.PHONY: build/7.5.1
build/7.5.1:
	buildah bud --build-arg CLIENT_VERSION=7.5.1 -t $(IMAGE):v7.5.1 -f Dockerfile .

.PHONY: push/7.5.1
push/7.5.1:
	podman push $(IMAGE):v7.5.1

.PHONY: build/base-cuda
build/base-cuda:
	buildah bud -t $(IMAGE):v7.5.1 -f Dockerfile . $(REPOSITORY)/$(ORG)/base-cuda:10.2

