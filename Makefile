# Makefile to build supported images
REGISTRY       ?= quay.io
ORG            ?= fah
IMAGE          ?= $(REGISTRY)/$(ORG)/fah-client
CUDA_IMAGE     ?= $(REGISTRY)/$(ORG)/fah-client-cuda

# Use bash for inline if-statements in arch_patch target
SHELL:=bash
OWNER:=fah

# Need to list the images in build dependency order
ALL_IMAGES:=base \
        client \
        control \
        viewer

build/%: DARGS?=
build/%: ## build the latest image for a stack
	buildah bud $(DARGS) --rm --force-rm --no-cache -t $(REGISTRY)/$(ORG)/$(notdir $@):latest -f Dockerfile ./$(notdir $@)

push/%: ## push the laste image for the stack
	podman push $(REGISTRY)/$(ORG)$(notdir $@):latest

