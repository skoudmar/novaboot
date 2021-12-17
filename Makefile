DESTDIR=
PREFIX=/usr

all:
	$(MAKE) -C server

README.md: novaboot
	pod2markdown $< > $@

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 novaboot $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/share/man/man1/
	pod2man novaboot $(DESTDIR)$(PREFIX)/share/man/man1/novaboot.1
	install -d $(DESTDIR)/etc/sudoers.d
	install -m 440 sudoers.novaboot $(DESTDIR)/etc/sudoers.d/novaboot
	install -d $(DESTDIR)/etc/novaboot.d
	install -m 644 etc.novaboot.txt $(DESTDIR)/etc/novaboot.d/README.txt
ifneq ($(INSTALL_SERVER),)
	$(MAKE) -C server install PREFIX=$(PREFIX)
endif

test:
	$(MAKE) -C tests

release:
	: gbp dch --release -N $(shell date +%Y%m%d) --commit
	: gbp buildpackage --git-tag -b
	: debrelease rtime
	: git push --follow-tags

snapshot:
	: gbp dch --snapshot --ignore-branch
	: DEB_BUILD_OPTIONS=nocheck gbp buildpackage -b --git-ignore-new --git-ignore-branch
