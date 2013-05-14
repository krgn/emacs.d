.PHONY: all

all:
	for n in $(ls *.el); do \
		emacs-24.3 --batch --eval "(byte-compile-file \"$n\")"; \
	done;
