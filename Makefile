.PHONY: deps uc eventsvc

deps:
	cd internal && go get ./...

uc:
	cd universal-correlator && $(MAKE) image

eventsvc:
	cd event-service && $(MAKE) image