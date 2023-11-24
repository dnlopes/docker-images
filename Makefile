SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec
.DEFAULT_GOAL := help
DOCKER_USERNAME := davlopes
DOCKER_IMAGE := spacelift-runner

##@ Development
ready: .PHONY ## Applies linting and validations
	@echo "Hello"

##@ Build
docker: .PHONY ## Build spacelift-runner Docker image
	docker buildx build --push --platform linux/amd64 --tag $(DOCKER_USERNAME)/$(DOCKER_IMAGE):latest -f docker/spacelift-runner.Dockerfile .

##@ Others
help: .PHONY ## Display this help (default target)
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY:
