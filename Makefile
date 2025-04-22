.PHONY: uc eventsvc dep-install

uc:
	cd universal-correlator && $(MAKE) image

eventsvc:
	cd event-service && $(MAKE) image

dep-install:
	cd upstream && $(MAKE) install