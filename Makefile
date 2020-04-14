# Makefile to build supported images
REGISTRY       ?= quay.io
ORG            ?= fah
IMAGE          ?= $(REGISTRY)/$(ORG)/fah-client
CUDA_IMAGE     ?= $(REGISTRY)/$(ORG)/fah-client-cuda

# Use bash for inline if-statements in arch_patch target
SHELL:=bash
OWNER:=fah

repo = $(firstword $(subst :, ,$1))
tag = $(or $(word 2,$(subst :, ,$1)),$(value 2))

# Build the base image for the FAH Client
build/base:
	buildah bud --rm --force-rm --no-cache -t $(REGISTRY)/$(ORG)/base:latest -f $(notdir $@)/Dockerfile ./$(notdir $@)

# Run like: make build/client:7.4.15
build/%: DARGS?=
build/%: ## build the latest image for a stack
	buildah bud $(DARGS) --rm --force-rm --no-cache -t $(REGISTRY)/$(ORG)/fah-$(call repo,$(notdir $@)):$(call tag,$(notdir $@)) -f $(call repo,$(notdir $@))/Dockerfile ./$(call repo,$(notdir $@))

#push/%: ## push the laste image for the stack
#	podman push $(REGISTRY)/$(ORG)$(notdir $@):latest
#
