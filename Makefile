# Copyright (C) 2015 Dmitriy Stepanenko
# This file is distributed under the same license as the mpolk/qujwilqyn package.

instroot = /usr/local
confdir = ${instroot}/etc
bindir = ${instroot}/bin
localedir = /usr/share/locale
POTFILE=qujwilqyn.pot

all: ru.mo

%.mo: %.po
	msgfmt $< -o $@

install: all
	if [ -e ${confdir}/qujwilqyn.conf ]; then \
	    install -o root -g root -m 644 -p qujwilqyn.conf ${confdir}/qujwilqyn.conf.new; \
	else \
	    install -o root -g root -m 644 -p qujwilqyn.conf ${confdir}/; \
	fi
	install -o root -g root -m 755 -p qujwilqyn ${bindir}/
	install -o root -g root -m 644 -p ru.mo ${localedir}/ru/LC_MESSAGES/qujwilqyn.mo

pot:	${POTFILE}
qujwilqyn.pot:	qujwilqyn
	if [ -f ${POTFILE} ]; then \
	    BACKUP=${POTFILE}; \
	    I="";\
	    while [ -f $$BACKUP ]; do \
		BACKUP=${POTFILE}.bak$$I; \
		I=$$(($${I:-0} + 1)); \
	    done; \
	    mv ${POTFILE} $$BACKUP; \
	fi; \
	xgettext qujwilqyn -LShell -k -k_ --from-code=UTF-8 -d qujwilqyn --no-wrap -o ${POTFILE}

po:	ru.po
%.po	: ${POTFILE}
	msgmerge -U --backup=existing $@ ${POTFILE}
