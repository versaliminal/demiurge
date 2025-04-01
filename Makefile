.PHONY: uc eventsvc

uc:
	cd universal-correlator && $(MAKE) image

eventsvc:
	cd event-service && $(MAKE) image