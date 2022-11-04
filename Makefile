.PHONY: all build release

IMAGE=dddpaul/wireguard
VERSION=v1.0.20210914-ls88-postupdown

all: build

build:
	@docker build --tag=${IMAGE} .

debug: build
	@docker run -it --entrypoint=sh ${IMAGE}

release: build
	@echo "Tag image with version ${VERSION}"
	@docker tag ${IMAGE} ${IMAGE}:${VERSION}

push: release
	@docker push ${IMAGE}
	@docker push ${IMAGE}:${VERSION}
