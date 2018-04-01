TARGETS := i3 vim zsh X11

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@ install

clean:
	$(MAKE) -C zsh clean

.PHONY: $(TARGETS) all clean
