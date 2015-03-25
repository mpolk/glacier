all: ru.mo

ru.mo: ru.po
	msgfmt $< -o $@

install: all
	install -o root -g root -m 644 -p ru.mo /usr/share/locale/ru/LC_MESSAGES/mpolk-glacier.mo
