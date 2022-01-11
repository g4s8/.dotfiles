TARGETS := vim bash

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@ install

clean:
	$(MAKE) -C zsh clean

.PHONY: $(TARGETS) all clean
