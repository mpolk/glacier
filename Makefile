all: ru.mo

ru.mo: ru.po
	msgfmt $< -o $@

install: all
	if [ -a /usr/local/etc/glacier.conf ]; then \
	    install -o root -g root -m 644 -p glacier.conf /usr/local/etc/glacier.conf.new; \
	else \
	    install -o root -g root -m 644 -p glacier.conf /usr/local/etc/; \
	fi
	install -o root -g root -m 755 -p glacier /usr/local/bin/
	install -o root -g root -m 644 -p ru.mo /usr/share/locale/ru/LC_MESSAGES/mpolk-glacier.mo
