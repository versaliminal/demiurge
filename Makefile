.PHONY: deps uc

deps:
	cd ../internal && go get ./...

uc:
	cd universal-correlator && $(MAKE) image