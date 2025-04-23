TRAEFIK_RELEASE := $(shell yq '.version | (split(".")|join("-"))' traefik-helm-chart/traefik/Chart.yaml)
PG_RELEASE := "v0.1"

.PHONY: package install

package:
	helm package traefik-helm-chart/traefik

install:
	./install.sh