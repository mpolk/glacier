# Copyright (C) 2015 Dmitriy Stepanenko
# This file is distributed under the same license as the mpolk/glacier package.

instroot = /usr/local
confdir = ${instroot}/etc
bindir = ${instroot}/bin
localedir = /usr/share/locale
POTFILE=glacier.pot

all: ru.mo

%.mo: %.po
	msgfmt $< -o $@

install: all
	if [ -e /usr/local/etc/glacier.conf ]; then \
	    install -o root -g root -m 644 -p glacier.conf /usr/local/etc/glacier.conf.new; \
	else \
	    install -o root -g root -m 644 -p glacier.conf /usr/local/etc/; \
	fi
	install -o root -g root -m 755 -p glacier /usr/local/bin/
	install -o root -g root -m 644 -p ru.mo ${locale}/ru/LC_MESSAGES/mpolk-glacier.mo

pot:	${POTFILE}
glacier.pot:	glacier
	if [ -f ${POTFILE} ]; then \
	    BACKUP=${POTFILE}; \
	    I="";\
	    while [ -f $$BACKUP ]; do \
		BACKUP=${POTFILE}.bak$$I; \
		I=$$(($${I:-0} + 1)); \
	    done; \
	    mv ${POTFILE} $$BACKUP; \
	fi; \
	xgettext glacier -LShell -k -k_ --from-code=UTF-8 -d mpolk-glacier --no-wrap -o ${POTFILE}

po:	ru.po
%.po	: ${POTFILE}
	msgmerge -U --backup=existing $@ ${POTFILE}
