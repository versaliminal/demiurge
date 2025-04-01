RELEASE_NAME := $(shell yq '.name' release/Chart.yaml)
RELEASE_VERSION := $(shell yq '.appVersion' release/Chart.yaml)
RELEASE_IMG := ${RELEASE_NAME}:${RELEASE_VERSION}
RELEASE_NAMESPACE := $(shell yq '.deployment.namespace' ../config.yaml)
RELEASE_PKG := ${RELEASE_NAME}-${RELEASE_VERSION}.tgz

.PHONY: openapi image clean uninstall docs test

openapi:
	cd source/api && go run github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen --config ../../openapi/event/config.yaml ../../openapi/event/spec.yaml

source/uc: openapi
	cd source && go build -o ../eventsvc .

local-build:
	cd source && go build -o eventsvc .

test:
	cd source && go test -v ./...

image: openapi
	docker build -t ${RELEASE_IMG} -f images/Dockerfile .

${RELEASE_PKG}: image
	helm package release

release: ${RELEASE_PKG}

install: release
	helm install ${RELEASE_NAME} ${RELEASE_PKG} -n ${RELEASE_NAMESPACE} --create-namespace

uninstall:
	helm uninstall ${RELEASE_NAME} -n ${RELEASE_NAMESPACE}

clean:
	docker rm `docker ps -q -f status=exited`
	docker rmi ${RELEASE_IMG}
	rm ${RELEASE_PKG}

docs:
	openapi-generator generate -g markdown -i openapi/health/spec.yaml -o docs