commit = $(shell git rev-parse --short HEAD)

all:

clean:
	rm -fv ./tmp/*.tar.*

pkg-roundabout:
	@echo Packaging Roundabout: Snapshot $(commit)
	tar --transform="s|^|roundabout-$(commit)/|" \
		-acf "./tmp/roundabout-$(commit).tar.xz" \
			etc/hotplug.d/iface/60-roundabout \
			etc/config/roundabout
