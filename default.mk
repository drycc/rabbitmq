SHELL := /bin/bash

# all monitor components share/use the following targets/exports
BUILD_TAG ?= git-$(shell git rev-parse --short HEAD)
DRYCC_REGISTRY ?= ${DEV_REGISTRY}
IMAGE_PREFIX ?= drycc
PLATFORM ?= linux/amd64,linux/arm64

include includes.mk
include versioning.mk
include deploy.mk

build: podman-build

podman-build:
	podman build --build-arg CODENAME=${CODENAME} -t ${IMAGE} .
	podman tag ${IMAGE} ${MUTABLE_IMAGE}

clean: check-podman
	podman rmi $(IMAGE)
	
test: test-style podman-build

.PHONY: build push podman-build clean upgrade deploy test test-style
