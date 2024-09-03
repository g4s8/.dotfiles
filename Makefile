CP := cp -v
BASEDIR := ${HOME}
UPDDIR = .update
TARGETS = $(shell git ls-files --format '.update/%(path)' | grep -v .gitignore)

.PHONY: update clean apply

update: $(TARGETS)
	@echo "Updated"

.update/%: $(BASEDIR)/%
	@mkdir -pv $(shell dirname $@)
	@$(CP) $< $@

apply: update
	@find .update/ -maxdepth 1 -exec $(CP) -r {} -t . \;

clean:
	rm -fr $(UPDDIR)
