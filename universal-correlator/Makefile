RELEASE_NAME := $(shell yq '.name' release/Chart.yaml)
RELEASE_VERSION := $(shell yq '.appVersion' release/Chart.yaml)
RELEASE_IMG := ${RELEASE_NAME}:${RELEASE_VERSION}
RELEASE_NAMESPACE := "demiurge"
RELEASE_PKG := ${RELEASE_NAME}-${RELEASE_VERSION}.tgz

${RELEASE_PKG}:
	docker build -t ${RELEASE_IMG} -f images/Dockerfile .
	helm package release

release: ${RELEASE_PKG}

install: release
	helm install ${RELEASE_NAME} ${RELEASE_PKG} -n ${RELEASE_NAMESPACE} --create-namespace

uninstall:
	helm uninstall ${RELEASE_NAME} -n ${RELEASE_NAMESPACE}

clean:
	docker rmi  ${RELEASE_IMG}
	rm ${RELEASE_PKG}