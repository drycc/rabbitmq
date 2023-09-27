# Drycc rabbitmq
[![Build Status](https://woodpecker.drycc.cc/api/badges/drycc/rabbitmq/status.svg)](https://woodpecker.drycc.cc/drycc/rabbitmq)

Drycc (pronounced DAY-iss) Workflow is an open source Platform as a Service (PaaS) that adds a developer-friendly layer to any [Kubernetes](http://kubernetes.io) cluster, making it easy to deploy and manage applications on your own servers.

## Development
The provided `Makefile` has various targets to help support building and publishing new images into a kubernetes cluster.

### Environment variables
There are a few key environment variables you should be aware of when interacting with the `make` targets.

* `BUILD_TAG` - The tag provided to the container image when it is built (defaults to the git-sha)
* `SHORT_NAME` - The name of the image (defaults to `grafana`)
* `DRYCC_REGISTRY` - This is the registry you are using (default `registry.drycc.cc`)
* `IMAGE_PREFIX` - This is the account for the registry you are using (default `drycc`)

### Make targets

* `make build` - Build podman image
* `make push` - Push podman image to a registry

The typical workflow will look something like this - `DRYCC_REGISTRY= IMAGE_PREFIX=foouser make build push`

## Description
A Container image for running rabbitmq on a Kubernetes cluster.
