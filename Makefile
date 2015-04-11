#----------------------------------------------------------------------------------
# Copyright (c) 2015 Dmitriy Stepanenko
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#----------------------------------------------------------------------------------

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